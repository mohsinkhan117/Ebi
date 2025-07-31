// lib/core/utils/permissions_utils.dart

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class PermissionUtils {
  static Future<bool> cameraMicrophoneAndStoragePermissionGranted() async {
    PermissionStatus cameraPermissionStatus = await getCameraPermission();
    PermissionStatus storagePermissionStatus = await getStoragePermission();
    PermissionStatus microphonePermissionStatus =
        await getMicrophonePermission();

    if (cameraPermissionStatus == PermissionStatus.granted &&
        microphonePermissionStatus == PermissionStatus.granted &&
        storagePermissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      _handleInvalidPermission(
        cameraPermissionStatus,
        microphonePermissionStatus,
        storagePermissionStatus,
      );
      return false;
    }
  }

  static Future<PermissionStatus> getCameraPermission() async {
    var status = await Permission.camera.status;
    if (status == PermissionStatus.denied) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.camera].request();
      return statuses[Permission.camera] ?? PermissionStatus.limited;
    } else {
      // print('CAMERA STATUS $status');
      return status;
    }
  }

  static Future<PermissionStatus> getMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (status == PermissionStatus.denied) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.microphone].request();
      return statuses[Permission.microphone] ?? PermissionStatus.limited;
    } else {
      // print('MICROPHONE STATUS $status');
      return status;
    }
  }

  static Future<PermissionStatus> getStoragePermission() async {
    var status = await Permission.storage.status;
    if (status == PermissionStatus.denied) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.storage].request();

      return statuses[Permission.storage] ?? PermissionStatus.limited;
    } else {
      // print('STORAGE STATUS $status');

      return status;
    }
  }

  static void _handleInvalidPermission(
    PermissionStatus cameraPermissionStatus,
    PermissionStatus microphonePermissionStatus,
    PermissionStatus storagePermissionStatus,
  ) {
    if (cameraPermissionStatus == PermissionStatus.denied &&
        microphonePermissionStatus == PermissionStatus.denied) {
      throw PlatformException(
        code: "PERMISSION_DENIED",
        message: "Access to Camera and Microphone denied",
        details: "null",
      );
    } else if (cameraPermissionStatus == PermissionStatus.restricted &&
        microphonePermissionStatus == PermissionStatus.restricted) {
      throw PlatformException(
        code: "PERMISSION_RESTRICTED",
        message: "Location data is not available on device",
        details: "null",
      );
    } else if (storagePermissionStatus == PermissionStatus.restricted &&
        storagePermissionStatus == PermissionStatus.restricted) {
      throw PlatformException(
        code: "PERMISSION_RESTRICTED",
        message: "Storage permission is not allowed  on device",
        details: "null",
      );
    }
  }

  static Future<PermissionResult> checkAndRequestPermissions() async {
    try {
      // Check for photos permission instead of storage on newer Android versions
      PermissionStatus cameraStatus = await Permission.camera.status;
      PermissionStatus storageStatus = await Permission.photos.status;

      // If already granted, return early
      if (cameraStatus.isGranted && storageStatus.isGranted) {
        return PermissionResult(
          granted: true,
          isPermanentlyDenied: false,
          message: 'All permissions granted',
        );
      }

      // If not permanently denied, request permissions
      if (!cameraStatus.isPermanentlyDenied &&
          !storageStatus.isPermanentlyDenied) {
        // Request permissions
        Map<Permission, PermissionStatus> statuses =
            await [Permission.camera, Permission.photos].request();

        // Check results after requesting
        bool allGranted = statuses.values.every((status) => status.isGranted);
        bool anyPermanentlyDenied = statuses.values.any(
          (status) => status.isPermanentlyDenied,
        );

        if (allGranted) {
          return PermissionResult(
            granted: true,
            isPermanentlyDenied: false,
            message: 'All permissions granted',
          );
        } else if (anyPermanentlyDenied) {
          return PermissionResult(
            granted: false,
            isPermanentlyDenied: true,
            message:
                'Permissions permanently denied. Please enable in settings.',
          );
        } else {
          return PermissionResult(
            granted: false,
            isPermanentlyDenied: false,
            message: 'Required permissions not granted',
          );
        }
      } else {
        // Handle permanently denied case
        return PermissionResult(
          granted: false,
          isPermanentlyDenied: true,
          message: 'Permissions permanently denied. Please enable in settings.',
        );
      }
    } catch (e) {
      return PermissionResult(
        granted: false,
        isPermanentlyDenied: false,
        message: 'Error checking permissions: ${e.toString()}',
      );
    }
  }
}

// ======================== PermissionResult ========================
class PermissionResult {
  final bool granted;
  final bool isPermanentlyDenied;
  final String message;

  PermissionResult({
    required this.granted,
    required this.isPermanentlyDenied,
    required this.message,
  });
}
