import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedFunc;
  final double? borderRadius;
  const CustomAppBar({
    Key? key,
    required this.titleAppBar,
    this.onPressedFunc,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 100,
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius ?? 0),
            bottomRight: Radius.circular(borderRadius ?? 0)),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 30,
        ),
        child: onPressedFunc == null
            ? null
            : IconButton(
                onPressed: onPressedFunc,
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
          titleAppBar,
          style: semiBold(
            sizeFont: 20,
            colorFont: whiteColor,
          ),
        ),
      ),
    );
  }
}
