import 'package:flutter/material.dart';

import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';

class ErorPage extends StatelessWidget {
  final String? textEror;
  const ErorPage({
    Key? key,
    required this.textEror,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Eror Page",
            style: extraBold(),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Eror dev: ${textEror ?? " "}",
            style: medium(),
          ),
          const SizedBox(
            height: 80,
          ),
          CustomButton(
            buttonText: "Kembali",
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
