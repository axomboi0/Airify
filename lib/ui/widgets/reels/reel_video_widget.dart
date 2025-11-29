import 'package:flutter/material.dart';
import '../../../core/models/reel.dart';
import 'reel_video_core.dart';
import 'reel_tap_layer.dart';
import 'reel_heart_animation.dart';
import 'reel_actions.dart';
import 'reel_caption.dart';
import 'reel_indicators.dart';
import 'package:video_player/video_player.dart';
import '../../screens/comment_sheet.dart';
import 'comment_pill.dart';

class ReelVideoWidget extends StatefulWidget {
  final Reel reel;
  final bool isActive;

  static bool globalMuted = false;

  const ReelVideoWidget({
    Key? key,
    required this.reel,
    required this.isActive,
  }) : super(key: key);

  @override
  State<ReelVideoWidget> createState() => _ReelVideoWidgetState();
}

class _ReelVideoWidgetState extends State<ReelVideoWidget>
    with SingleTickerProviderStateMixin {
  bool _showHeart = false;
  late AnimationController _heartCtrl;

  bool _videoReady = false;
  bool _isPlaying = false;

  bool _muted = ReelVideoWidget.globalMuted;

  VideoPlayerController? _coreController;
  VoidCallback? _coreListener;

  @override
  void initState() {
    super.initState();
    _heartCtrl =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  void didUpdateWidget(covariant ReelVideoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_muted != ReelVideoWidget.globalMuted) {
      setState(() => _muted = ReelVideoWidget.globalMuted);
      if (_coreController != null && _coreController!.value.isInitialized) {
        _coreController!.setVolume(_muted ? 0 : 1);
      }
    }

    if (oldWidget.isActive != widget.isActive) {
      if (widget.isActive && _videoReady) {
        try {
          _coreController?.play();
        } catch (_) {}
        setState(() => _isPlaying = true);
      } else if (!widget.isActive && _videoReady) {
        try {
          _coreController?.pause();
        } catch (_) {}
        setState(() => _isPlaying = false);
      }
    }
  }

  @override
  void dispose() {
    if (_coreController != null && _coreListener != null) {
      _coreController!.removeListener(_coreListener!);
    }
    _heartCtrl.dispose();
    super.dispose();
  }

  void _onCoreInitialized(VideoPlayerController controller) {
    if (_coreController != null && _coreListener != null) {
      _coreController!.removeListener(_coreListener!);
      _coreListener = null;
    }

    _coreController = controller;

    _coreListener = () {
      if (!mounted) return;
      final playing = _coreController?.value.isPlaying ?? false;
      if (_isPlaying != playing) {
        setState(() {
          _isPlaying = playing;
        });
      }
    };
    _coreController!.addListener(_coreListener!);

    _coreController!.setVolume(ReelVideoWidget.globalMuted ? 0 : 1);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _coreController == null) return;

      if (widget.isActive && !_coreController!.value.isPlaying) {
        try {
          _coreController!.play();
        } catch (_) {}
      }

      setState(() {
        _videoReady = _coreController!.value.isInitialized;
        _isPlaying = _coreController!.value.isPlaying;
        _muted = ReelVideoWidget.globalMuted;
      });
    });
  }

  void _onPlayChanged(bool playing) {
    if (!mounted) return;
    setState(() => _isPlaying = playing);
  }

  void _toggleMute() {
    ReelVideoWidget.globalMuted = !ReelVideoWidget.globalMuted;
    setState(() => _muted = ReelVideoWidget.globalMuted);
    if (_coreController != null && _coreController!.value.isInitialized) {
      _coreController!.setVolume(_muted ? 0 : 1);
    }
  }

  void _togglePlayPause() {
    if (!_videoReady || _coreController == null) {
      setState(() => _isPlaying = !_isPlaying);
      return;
    }

    try {
      if (_coreController!.value.isPlaying) {
        _coreController!.pause();
        setState(() => _isPlaying = false);
      } else {
        _coreController!.play();
        setState(() => _isPlaying = true);
      }
    } catch (_) {}
  }

  void _triggerHeart() {
    setState(() => _showHeart = true);
    _heartCtrl.forward(from: 0);

    Future.delayed(const Duration(milliseconds: 650), () {
      if (mounted) setState(() => _showHeart = false);
    });
  }

  void _openComments() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CommentSheet(reel: widget.reel),
    );
  }

  void _openReelMoreMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  MenuItem(icon: Icons.bookmark_border, label: "Save"),
                  MenuItem(icon: Icons.repeat, label: "Remix"),
                  MenuItem(icon: Icons.crop, label: "Sequence"),
                ],
              ),
              const SizedBox(height: 20),
              const TextItem("Why you're seeing this post"),
              const TextItem("Interested"),
              const TextItem("Not Interested"),
              const TextItem("Report", color: Colors.red),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final coreType = widget.reel.sourceType == ReelSourceType.asset
        ? CoreSourceType.asset
        : (widget.reel.sourceType == ReelSourceType.network
            ? CoreSourceType.network
            : CoreSourceType.file);

    return Stack(
      fit: StackFit.expand,
      children: [
        ReelVideoCore(
          source: widget.reel.source,
          sourceType: coreType,
          playWhenActive: widget.isActive,
          muted: _muted,
          onInitialized: _onCoreInitialized,
          onPlayChanged: _onPlayChanged,
        ),
        ReelTapLayer(
          onTopTap: _toggleMute,
          onBottomTap: _togglePlayPause,
          onDoubleTap: _triggerHeart,
        ),
        if (_showHeart)
          ReelHeartAnimation(
            scale: Tween(begin: 0.8, end: 1.3).animate(
                CurvedAnimation(parent: _heartCtrl, curve: Curves.elasticOut)),
          ),
        Positioned.fill(
          child: IgnorePointer(
            child: Center(
              child: ReelIndicators(
                muted: _muted,
                paused: !_isPlaying,
                show: !_isPlaying,
              ),
            ),
          ),
        ),
        ReelActions(
          likes: widget.reel.likes,
          comments: widget.reel.comments,
          isLiked: widget.reel.isLiked,
          onShare: () {},
          onComments: _openComments,
          onLike: _triggerHeart,
          onMore: _openReelMoreMenu,
        ),
        ReelCaption(
          username: widget.reel.username,
          caption: widget.reel.caption,
          profileImage: widget.reel.profileImage,
        ),
        CommentPill(
          avatarAsset: widget.reel.profileImage,
          onTap: _openComments,
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white10,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class TextItem extends StatelessWidget {
  final String text;
  final Color color;

  const TextItem(this.text, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: TextStyle(color: color)),
      onTap: () {},
    );
  }
}
