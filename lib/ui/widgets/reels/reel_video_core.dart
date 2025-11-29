// lib/ui/widgets/reels/reel_video_core.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum CoreSourceType { asset, network, file }

typedef VideoInitialized = void Function(VideoPlayerController controller);

class ReelVideoCore extends StatefulWidget {
  final String source;
  final CoreSourceType sourceType;
  final bool playWhenActive;
  final bool muted;
  final ValueChanged<bool>? onPlayChanged;
  final VideoInitialized? onInitialized;

  const ReelVideoCore({
    Key? key,
    required this.source,
    required this.sourceType,
    required this.playWhenActive,
    required this.muted,
    this.onPlayChanged,
    this.onInitialized,
  }) : super(key: key);

  @override
  State<ReelVideoCore> createState() => _ReelVideoCoreState();
}

class _ReelVideoCoreState extends State<ReelVideoCore> {
  VideoPlayerController? _controller;
  bool _ready = false;
  String? _activeSource;
  CoreSourceType? _activeSourceType;

  @override
  void initState() {
    super.initState();
    _activeSource = null;
    _activeSourceType = null;
    _initIfNeeded();
  }

  // initialize only when needed (new source)
  Future<void> _initIfNeeded() async {
    if (_activeSource == widget.source &&
        _activeSourceType == widget.sourceType &&
        _controller != null) {
      // already initialized for this source
      // still ensure play policy in case flags changed while init wasn't required
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyPlayPolicy();
      });
      return;
    }

    // create new controller for new source
    _disposeController();

    try {
      if (widget.sourceType == CoreSourceType.asset) {
        _controller = VideoPlayerController.asset(widget.source);
      } else if (widget.sourceType == CoreSourceType.network) {
        _controller = VideoPlayerController.networkUrl(Uri.parse(widget.source));
      } else {
        _controller = VideoPlayerController.file(File(widget.source));
      }

      // remember current source so we don't recreate unnecessarily
      _activeSource = widget.source;
      _activeSourceType = widget.sourceType;

      _controller!.setLooping(true);

      await _controller!.initialize();

      // set initial volume according to the latest muted flag
      _controller!.setVolume(widget.muted ? 0 : 1);

      // attach listener AFTER initialization to forward actual playing state
      _controller!.addListener(_forwardPlayState);

      // flag ready and notify parent
      _ready = true;
      widget.onInitialized?.call(_controller!);

      // Immediately notify parent's play state so UI syncs without delay
      widget.onPlayChanged?.call(_controller!.value.isPlaying);

      // ensure we use the most recent playWhenActive: use post frame callback to avoid races
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _controller == null) return;
        _applyPlayPolicy();
        setState(() {}); // update UI (progress/indicator) if needed
      });
    } catch (e) {
      // keep UI responsive on failure, don't crash
      _ready = false;
      _activeSource = null;
      _activeSourceType = null;
      _disposeController();
    }
  }

  void _applyPlayPolicy() {
    if (!mounted || _controller == null || !_controller!.value.isInitialized) return;

    if (widget.playWhenActive) {
      // only start playing if not already playing
      if (!_controller!.value.isPlaying) _controller!.play();
    } else {
      if (_controller!.value.isPlaying) _controller!.pause();
    }

    // ensure volume follows latest muted value
    _controller!.setVolume(widget.muted ? 0 : 1);
  }

  void _forwardPlayState() {
    if (!mounted) return;
    final isPlaying = _controller?.value.isPlaying ?? false;
    widget.onPlayChanged?.call(isPlaying);
  }

  @override
  void didUpdateWidget(covariant ReelVideoCore oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the source or sourceType changed, re-init
    if (oldWidget.source != widget.source || oldWidget.sourceType != widget.sourceType) {
      _initIfNeeded();
      return;
    }

    // If muted flag changed, update volume immediately
    if (oldWidget.muted != widget.muted && _controller != null && _controller!.value.isInitialized) {
      _controller!.setVolume(widget.muted ? 0 : 1);
    }

    // If playWhenActive changed, apply policy (play/pause)
    // guard to ensure controller is initialized first
    if (oldWidget.playWhenActive != widget.playWhenActive && _controller != null && _controller!.value.isInitialized) {
      _applyPlayPolicy();
    }
  }

  void _disposeController() {
    try {
      _controller?.removeListener(_forwardPlayState);
    } catch (_) {}
    try {
      _controller?.dispose();
    } catch (_) {}
    _controller = null;
    _ready = false;
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready || _controller == null) {
      // keep a loading indicator so UI doesn't build an invalid widget (prevents RenderSliver errors)
      return const Center(child: CircularProgressIndicator(color: Colors.white));
    }

    // Use AspectRatio & VideoPlayer directly (adaptive)
    return Center(
      child: AspectRatio(
        aspectRatio: _controller!.value.aspectRatio == 0 ? (16 / 9) : _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      ),
    );
  }
}
