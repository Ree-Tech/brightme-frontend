import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: purpleColor,
            fixedSize: const Size(double.infinity, 48),
            shape: const StadiumBorder()),
        child: Text(
          buttonText,
          style: semiBold(
            sizeFont: 16,
            colorFont: whiteColor,
          ),
        ),
      ),
    );
  }
}
