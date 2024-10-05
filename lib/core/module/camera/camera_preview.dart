import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigap_mobile/core/helper/general_function.dart';
import 'package:sigap_mobile/presentation/widgets/general_widget.dart';

class PreviewCameraPage extends StatelessWidget {
  final XFile imageFile;
  const PreviewCameraPage({Key? key, required this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                File(imageFile.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.all(25),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      circleIcon(
                        onPress: () => Get.back(),
                        backgroundColor: Colors.black54.withOpacity(0.8),
                        icon: Icons.close,
                      ),
                      circleIcon(
                        onPress: () async {
                          // showImageInfo(context);
                          Get.back(result: File(imageFile.path));
                        },
                        backgroundColor: Colors.black54.withOpacity(0.8),
                        icon: Icons.check,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showImageInfo(BuildContext context) async {
    // Show Image Info
    String size = await AppFunction.getFileSize(imageFile.path, 2);
    Toast.show("$size, ${imageFile.path}");
  }
}
