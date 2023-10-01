import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/route.dart';
import 'package:bright_me/pages/app_page.dart';
import 'package:bright_me/pages/onboarding/onboarding_page.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: whiteColor,
      ),
      onGenerateRoute: RouteGenarator.generateRoute,
      home: const OnboardingPage(),
    );
  }
}
