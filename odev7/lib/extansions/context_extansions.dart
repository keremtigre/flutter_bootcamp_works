import 'package:flutter/material.dart';

extension BuildContextExtansion on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextStyle get todoTitleStyle =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: width / 20);
}
