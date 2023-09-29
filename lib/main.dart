import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/route.dart';
import 'package:bright_me/pages/app_page.dart';
import 'package:bright_me/pages/auth/login_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(fontFamily: "Poppins", scaffoldBackgroundColor: whiteColor),
      // initialRoute: "/",
      onGenerateRoute: RouteGenarator.generateRoute,
      home: AppPages(),
    );
  }
}
