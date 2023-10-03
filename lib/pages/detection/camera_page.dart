import 'dart:async';
import 'dart:io';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;
  bool _isFlashOn = false;
  String imagePath = '';
  final ImagePicker _picker = ImagePicker();
  bool _showContainer = true;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    onNewCameraSelected(cameras[1]);
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showContainer = false;
      });
    });
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  //use camera falsh
  void toggleFlash() async {
    try {
      if (controller != null) {
        final bool currentFlash =
            controller!.value.flashMode == FlashMode.torch;
        final FlashMode newFlashMode =
            currentFlash ? FlashMode.off : FlashMode.torch;

        await controller!.setFlashMode(newFlashMode);
        setState(() {
          _isFlashOn = !currentFlash;
        });
      }
    } on CameraException catch (e) {
      print('Error toggling flash: $e');
    }
  }

  //take picture user
  Future<void> capturePhoto() async {
    if (!controller!.value.isInitialized) {
      return;
    }

    try {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String filePath = '${appDir.path}/$timestamp.jpg';

      await controller!.takePicture();

      setState(() {
        imagePath = filePath;
      });
      handleResultPage();
    } catch (e) {
      print('Error capturing photo: ${e.toString()}');
    }
  }

  //take picture from user gallery
  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          imagePath = pickedFile.path;
        });
      }
      print(imagePath);
    } catch (e) {
      print('Error picking image from gallery: ${e.toString()}');
    }
  }

  //navigate to result page ML
  handleResultPage() {
    Navigator.pushReplacementNamed(context, processResultRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isCameraInitialized
            ? Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / controller!.value.aspectRatio,
                      child: Stack(children: [
                        controller!.buildPreview(),
                        SafeArea(
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 25),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              toggleFlash();
                                            },
                                            icon: Icon(
                                              _isFlashOn
                                                  ? Icons.flash_on
                                                  : Icons.flash_off,
                                              color: blackColor,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushReplacementNamed(
                                                  context, appRoute);
                                            },
                                            icon: const Icon(
                                              Icons.close_sharp,
                                              color: blackColor,
                                            ))
                                      ],
                                    ),
                                    if (_showContainer)
                                      Container(
                                        width: 275,
                                        height: 85,
                                        margin: const EdgeInsets.only(top: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(34),
                                          color: lightPuprle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Please face the camera and adjust\nyour face accordingly",
                                            style: semiBold(
                                              sizeFont: 14,
                                              colorFont: purpleColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              )),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    color: lightWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () async {
                              await pickImageFromGallery();
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: purpleColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.image_outlined,
                                color: whiteColor,
                              ),
                            )),
                        InkWell(
                            onTap: () async {
                              await capturePhoto();
                            },
                            child: const Icon(
                              Icons.camera,
                              color: purpleColor,
                              size: 34,
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isCameraInitialized = false;
                            });
                            onNewCameraSelected(
                              cameras[_isRearCameraSelected ? 0 : 1],
                            );
                            setState(() {
                              _isRearCameraSelected = !_isRearCameraSelected;
                            });
                          },
                          child: Image.asset(
                            "assets/images/icon_camera_flip.jpg",
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container());
  }
}
