import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigap_mobile/core/helper/general_function.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:sigap_mobile/presentation/widgets/general_widget.dart';

import 'camera_preview.dart';


enum CameraType {
  REAR,
  FRONT,
}

T? _ambiguate<T>(T? value) => value;

class CameraModule extends StatefulWidget {
  final CameraType cameraType;
  final bool showInfo;
  final ResolutionPreset resolutionPreset;
  const CameraModule(
      {Key? key,
        required this.cameraType,
        required this.showInfo,
        this.resolutionPreset = ResolutionPreset.high})
      : super(key: key);

  @override
  _CameraModuleState createState() => _CameraModuleState();
}

class _CameraModuleState extends State<CameraModule>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  int? selectedCameraIndex;

  onInit() async {
    await availableCameras().then((value) {
      if (value.isNotEmpty) {
        cameras = value;
        if (cameras!.isNotEmpty) {
          selectedCameraIndex = 0;
          initCamera(cameras![selectedCameraIndex!]).then((_) {});
        } else {
          Toast.show("Kamera tidak ditemukan");
        }
      }
    }).catchError((e) {
      debugPrint(e.code.t);
    });
  }

  @override
  void initState() {
    super.initState();
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);
    onInit();
  }

  @override
  void dispose() {
    super.dispose();
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    _cameraController?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _cameraController;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera(cameraController.description);
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
    }
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );
    _cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (_cameraController!.value.hasError) {
      Toast.show("Terjadi kesalahan pada kamera");
    }

    try {
      _cameraController!.initialize();
    } catch (e) {
      debugPrint("Terjadi kesalahan pada kamera.\n$e");
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54.withOpacity(0),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: cameraPreview(),
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
                  cameraControl(context),
                  flipCameraButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cameraPreview() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return loadingIndicator;
    }
    var camera = _cameraController!.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(_cameraController!),
      ),
    );
  }

  Widget cameraControl(context) {
    return Align(
      alignment: Alignment.topCenter,
      child: circleIcon(
          size: 80,
          iconSize: 50,
          onPress: () => onCapture(context),
          color: Colors.white,
          backgroundColor: Colors.black54.withOpacity(0.8),
          icon: Icons.camera),
    );
  }

  flipCameraButton() {
    if (cameras == null) {
      return Container();
    }
    CameraDescription selectedCamera = cameras![selectedCameraIndex!];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: circleIcon(
          onPress: () => onSwitchCamera(),
          color: Colors.white,
          backgroundColor: Colors.black54.withOpacity(0.8),
          icon: getCameraLensIcon(lensDirection),
        ),
      ),
    );
  }

  getCameraLensIcon(CameraLensDirection lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.external:
        return CupertinoIcons.switch_camera;
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex! < cameras!.length - 1
        ? selectedCameraIndex! + 1
        : 0;
    CameraDescription selectedCamera = cameras![selectedCameraIndex!];
    initCamera(selectedCamera);
  }

  onCapture(context) async {
    try {
      await _cameraController!.takePicture().then((value) async {
        final arguments = Get.to(() => PreviewCameraPage(imageFile: value));
        arguments?.then((value) {
          if (value != null) {
            Get.back(result: value);
          }
        });
      });
    } catch (e) {
      debugPrint("Error : ${e.toString()}");
    }
  }
}
