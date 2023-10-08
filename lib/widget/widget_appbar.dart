import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

AppBar widgetAppBar(BuildContext context, String title) {
  return AppBar(
    toolbarHeight: 100,
    centerTitle: true,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 80,
      ),
      child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          )),
    ),
    backgroundColor: purpleColor,
    title: Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 30,
      ),
      child: Text(
        title,
        style: semiBold(
          sizeFont: 20,
          colorFont: whiteColor,
        ),
      ),
    ),
  );
}
