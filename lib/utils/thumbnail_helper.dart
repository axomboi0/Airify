import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailCache {
  ThumbnailCache._();

  // Clean + stable filename converter
  static String _sanitize(String input) {
    return input
        .replaceAll(RegExp(r'[^A-Za-z0-9_]'), '_') // remove all weird chars
        .replaceAll('__', '_')
        .toLowerCase();
  }

  // Main entry → returns cached thumbnail OR generates new
  static Future<String?> getThumbnail(String videoPath) async {
    final fileName = _sanitize(videoPath);
    final cacheDir = await getTemporaryDirectory();
    final thumbPath = '${cacheDir.path}/$fileName.jpg';
    final file = File(thumbPath);

    // Thumbnail already exists
    if (await file.exists()) {
      return thumbPath;
    }

    // Not cached → generate
    return await forceGenerate(videoPath);
  }

  // Always generate fresh thumbnail
  static Future<String?> forceGenerate(String videoPath) async {
    final fileName = _sanitize(videoPath);
    final cacheDir = await getTemporaryDirectory();
    final thumbPath = '${cacheDir.path}/$fileName.jpg';

    try {
      final generated = await VideoThumbnail.thumbnailFile(
        video: videoPath,
        thumbnailPath: thumbPath,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 160,   // small but crisp for grid
        quality: 40,     // balanced quality
      );

      // If generation fails
      if (generated == null || generated.isEmpty) {
        return null;
      }

      return generated;
    } catch (e) {
      // Debug only if needed
      return null;
    }
  }
}
