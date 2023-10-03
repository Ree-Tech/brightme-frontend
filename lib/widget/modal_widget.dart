import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';

class ModalBottomWidget extends StatelessWidget {
  final List<Widget> childrenWidget;
  const ModalBottomWidget({
    Key? key,
    required this.childrenWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: ListView(controller: scrollController, children: childrenWidget),
      ),
    );
  }
}
