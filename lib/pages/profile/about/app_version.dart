import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';

class AppVersionPage extends StatelessWidget {
  const AppVersionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar(
        context,
        'App Version',
        true,
        false,
        () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 168,
                height: 168,
              ),
              Text(
                "Current Version 1.0.0",
                style: medium(
                  colorFont: greyColor,
                  sizeFont: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Text(
                  "Latest Version: 1.0.1",
                  style: medium(
                    sizeFont: 14,
                    colorFont: blackColor,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                child: CustomButton(
                  onPressed: () {},
                  buttonText: "Update",
                  heightButton: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
