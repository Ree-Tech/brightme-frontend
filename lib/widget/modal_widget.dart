import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';

class ModalBottomWidget extends StatelessWidget {
  final List<Widget> childrenWidget;
  final double? maxModalHeight;
  final double? borderRadius;
  const ModalBottomWidget({
    Key? key,
    required this.childrenWidget,
    this.maxModalHeight,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: maxModalHeight ?? 0.6,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(borderRadius ?? 16))),
        child: ListView(controller: scrollController, children: childrenWidget),
      ),
    );
  }
}
