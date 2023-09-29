import 'package:bright_me/config/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:bright_me/config/font_theme.dart';

class SurveyOnePage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  const SurveyOnePage({
    Key? key,
    required this.nameController,
    required this.ageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: semiBold(
            sizeFont: 16,
          ),
        ),
        TextField(
          controller: nameController,
          style: medium(
            sizeFont: 14,
          ),
          decoration: const InputDecoration(
            hintText: "Name",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor, width: 1.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor, width: 1.0),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "Age",
          style: semiBold(
            sizeFont: 16,
          ),
        ),
        TextField(
          controller: ageController,
          style: medium(
            sizeFont: 14,
          ),
          decoration: const InputDecoration(
            hintText: "Years old",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor, width: 1.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor, width: 1.0),
            ),
          ),
        )
      ],
    );
  }
}
