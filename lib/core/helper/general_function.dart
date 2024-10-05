import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sigap_mobile/core/module/camera/camera_module.dart';
import 'package:sigap_mobile/presentation/widgets/custom_dialog_widget.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

// ----------------------------------------------------------------------------------------
//                               Toast
// ----------------------------------------------------------------------------------------

class Toast {
  static show(String message) =>  Fluttertoast.showToast(msg: message);
  static hide() => Fluttertoast.cancel();
}


// ----------------------------------------------------------------------------------------
//                               DIALOG
// ----------------------------------------------------------------------------------------
enum TypeDialog {
  FAILED,
  SUCCESS,
  WARNING,
  SOON,
}

class Loading {
  static show() => showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => const LoadingDialog());

  static hide() => Get.back();
}

class AppDialog {
  static show({required TypeDialog typeDialog, String? title, required String message, required Function onPress, bool? dismissible}) {
    switch (typeDialog) {
      case TypeDialog.FAILED:
        return showDialog(
          barrierDismissible: true,
          context: Get.context!,
          builder: (context) => FailedDialog(
            title: title ?? "Gagal",
            description: message,
            onPress: () => onPress(),
          ),
        );
      case TypeDialog.SUCCESS:
        return showDialog(
          barrierDismissible: dismissible ?? false,
          context: Get.context!,
          builder: (context) => SuccessDialog(
            title: title ?? "Berhasil",
            description: message,
            onPress: () => onPress(),
          ),
        );
      case TypeDialog.WARNING:
        return showDialog(
          barrierDismissible: true,
          context: Get.context!,
          builder: (context) => WarningDialog(
            title: title ?? "Peringatan!",
            description: message,
            confirmPress: () => onPress,
            cancelPress: () => close(),
          ),
        );
      case TypeDialog.SOON:
        return showDialog(
          barrierDismissible: true,
          context: Get.context!,
          builder: (context) => const CommingSoonDialog(),
        );
    }
  }

  static close() => Get.back();
}


class AppFunction {
  static Future<String> getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    debugPrint("Path : $filepath");
    debugPrint("Size : $bytes");
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  static Future<Uint8List> compressBytes(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 20,
    );
    debugPrint(list.length.toString());
    debugPrint(result.length.toString());
    return result;
  }

  static Future<File?> compressFile({required File file, required String targetPath}) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 3,
    );
    debugPrint(file.lengthSync().toString());
    debugPrint(result?.lengthSync().toString());
    return result;
  }

  // Download File
  static Future<File> downloadFile(String url, {name}) async {
    var fileName = "result-infinite-digital-security";
    if (name != null) {
      fileName = name;
    }
    try {
      final rs = await Dio().get<List<int>>(url,
          options: Options(responseType: ResponseType.bytes));
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      File urlFile = await file.writeAsBytes(rs.data!);
      return urlFile;
    } catch (e) {
      debugPrint("Error : $e");
      throw Exception("Error opening url file");
    }
  }

  static Future<String> downloadFilePath(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";
    await Dio().download(url, filePath);
    return filePath;
  }

  static openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split("/").last;
    final file = await downloadFilePath(url, name);
    debugPrint("Path : $file");
    OpenFile.open(file);
  }

  // ----------------------------------------------------------------------------------------
  //                                 File/Image Picker
  // ----------------------------------------------------------------------------------------

  static Future<File?> pickGalleryPhoto(
      ImageSource source, ImagePicker imagePicker) async {
    XFile? _pickedFile = await imagePicker.pickImage(
      source: source,
      imageQuality: 40,
    );
    return File(_pickedFile!.path);
  }

  static Future<File?> pickCameraPhoto(
      {CameraType cameraType = CameraType.REAR,
        ResolutionPreset resolution = ResolutionPreset.high,
        bool showInfo = false,
      }) async {
    return Get.to(() => CameraModule(
      cameraType: cameraType,
      resolutionPreset: resolution,
      showInfo: showInfo,
    ));
  }

  static Future<File?> takeVideo(ImageSource source, ImagePicker filePicker) async {
    XFile? _pickedFile = await filePicker.pickVideo(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      maxDuration: const Duration(seconds: 20),
    );
    return File(_pickedFile!.path);
  }

  static Future<File?> pickFile(BuildContext context, String type) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["pdf"]);
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    }
  }
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}