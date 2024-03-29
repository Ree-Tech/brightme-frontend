import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text,
    [Color? textColor, Color? bgColor]) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: medium(
        colorFont: textColor ?? whiteColor,
        sizeFont: 12,
      ),
    ),
    backgroundColor: bgColor ?? purpleColor,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 20,
      left: 20,
      right: 20,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
