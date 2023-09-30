import 'package:bright_me/config/route_name.dart';
import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';

Future dialogPopUP(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          title: Text(
            "For better results, it is recommended not\nto use make up when taking photos",
            style: medium(colorFont: blackColor, sizeFont: 14),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: SizedBox(
                  width: 210,
                  child: CustomButton(
                    buttonText: "Okay",
                    onPressed: () {
                      Navigator.pushNamed(context, cameraPage);
                    },
                  )),
            ),
          ],
        );
      });
}
