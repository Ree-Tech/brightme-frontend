import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar(
        context,
        'Help Center',
        true,
        false,
        () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Should you need to contact our admin for assistance, please send an email to ",
              style: medium(
                colorFont: blackColor,
                sizeFont: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "brightmeofficial01@gmail.com ",
              style: bold(
                sizeFont: 14,
                colorFont: purpleColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "We're here to help!",
              style: medium(
                colorFont: blackColor,
                sizeFont: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset("assets/images/help_center.png"),
            )
          ],
        ),
      ),
    );
  }
}
