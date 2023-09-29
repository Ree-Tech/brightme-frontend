import 'package:bright_me/config/color_theme.dart';
import 'package:flutter/material.dart';

TextStyle extraBold({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? darGreykColor,
      fontSize: sizeFont ?? 24,
      fontWeight: FontWeight.w800,
    );

TextStyle bold({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? darGreykColor,
      fontSize: sizeFont ?? 20,
      fontWeight: FontWeight.w700,
    );

TextStyle semiBold({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? darGreykColor,
      fontSize: sizeFont ?? 20,
      fontWeight: FontWeight.w600,
    );

TextStyle medium({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? darGreykColor,
      fontSize: sizeFont ?? 20,
      fontWeight: FontWeight.w500,
    );

TextStyle reguler({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? darGreykColor,
      fontSize: sizeFont ?? 20,
      fontWeight: FontWeight.w400,
    );
