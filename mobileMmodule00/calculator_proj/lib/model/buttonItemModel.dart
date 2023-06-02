import 'package:flutter/material.dart';

class ButtonItemModel {
  final String text;
  final Color textColor;
  final Color fillColor;
  final double textSize;
  // final Function callback;

  ButtonItemModel({
    required this.text,
    this.fillColor = Colors.white12,
    this.textColor = Colors.white,
    this.textSize = 22,
    // required this.callback,
  });
}
