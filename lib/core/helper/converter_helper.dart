import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ConverterHelper {
  static String toBase64({XFile? imageFile, File? file}) {
    try {
      if (imageFile != null) {
        final bytes = File(imageFile.path).readAsBytesSync();
        String _img64Path = base64Encode(bytes);
        debugPrint("toBase64 Success");
        return _img64Path;
      } else if (file != null) {
        final bytes = File(file.path).readAsBytesSync();
        String _file64Path = base64Encode(bytes);
        debugPrint("toBase64 Success");
        return _file64Path;
      } else {
        return "Anda belum memilih file";
      }
    } catch (e) {
      debugPrint("toBase64 Exception : ${e.toString()}");
      return e.toString();
    }
  }

  static String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
  }
}