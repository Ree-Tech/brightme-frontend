import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

AppBar whiteAppBar(
  BuildContext context,
  String text,
  bool showLeading,
  bool showAction,
  void Function()? onpressFunc,
) =>
    AppBar(
      title: Text(
        text,
        style: semiBold(
          colorFont: blackColor,
          sizeFont: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: whiteColor,
      elevation: 0,
      leading: showLeading
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: blackColor,
              ))
          : null,
      actions: showAction
          ? [
              IconButton(
                  onPressed: onpressFunc,
                  icon: const Icon(
                    Icons.check,
                    color: blackColor,
                    size: 24,
                  ))
            ]
          : [],
    );
