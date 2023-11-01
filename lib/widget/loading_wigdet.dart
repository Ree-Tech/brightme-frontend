import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? purpleColor,
      ),
    );
  }
}
