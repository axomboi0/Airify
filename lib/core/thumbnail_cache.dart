import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailCache {
  static Future<String?> getThumbnail(String videoPath) async {
    try {
      // 🔥 This folder NEVER gets deleted by Android
      final dir = await getApplicationDocumentsDirectory();

      final fileName = "thumb_${videoPath.hashCode}.jpg";
      final filePath = "${dir.path}/$fileName";

      final file = File(filePath);

      // Already generated → return instantly
      if (await file.exists()) {
        return filePath;
      }

      // Generate thumbnail
      final tempThumb = await VideoThumbnail.thumbnailFile(
        video: videoPath,
        imageFormat: ImageFormat.JPEG,
        quality: 80,
      );

      if (tempThumb == null) return null;

      // Save permanently
      await File(tempThumb).copy(filePath);

      return filePath;
    } catch (_) {
      return null;
    }
  }
}
