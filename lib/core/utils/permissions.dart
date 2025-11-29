import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static Future<bool> requestPhotosPermission() async {
    if (await Permission.photos.isGranted) return true;

    final status = await Permission.photos.request();
    return status.isGranted;
  }

  static Future<bool> requestCameraPermission() async {
    if (await Permission.camera.isGranted) return true;

    final status = await Permission.camera.request();
    return status.isGranted;
  }
}
