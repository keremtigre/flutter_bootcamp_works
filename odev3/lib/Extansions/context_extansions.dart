import 'package:flutter/material.dart';

extension BuildContextExtansion on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextStyle get noteTitleStyle =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: width / 20);
  TextStyle get noteDateStyle =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: width / 30);
  TextStyle get noteTimeStyle =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: width / 30);
}
