import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.groupValue,
  }) : super(key: key);

  final Widget label;
  final int? groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: RadioListTile(
        activeColor: purpleColor,
        value: value,
        groupValue: groupValue,
        title: label,
        onChanged: (val) {
          onChanged(val!);
        },
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
