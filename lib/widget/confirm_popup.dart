import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';

class ConfirmPopUp extends StatelessWidget {
  final String title;
  final String confirmButtonText;
  final void Function()? onPressedConfirm;

  const ConfirmPopUp({
    Key? key,
    required this.title,
    required this.confirmButtonText,
    this.onPressedConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: medium(
          sizeFont: 15,
          colorFont: blackColor,
        ),
      ),
      actions: [
        Row(
          children: [
            SizedBox(
                width: 130,
                child: CustomButton(
                  buttonText: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: onPressedConfirm,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      fixedSize: const Size(double.infinity, 48),
                      shape: const StadiumBorder(
                          side: BorderSide(color: purpleColor, width: 1))),
                  child: Text(
                    confirmButtonText,
                    style: semiBold(
                      sizeFont: 16,
                      colorFont: purpleColor,
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
