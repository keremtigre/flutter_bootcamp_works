// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Note {
  late String title;
  late String date;
  late String time;
  late Color color;

  Note({
    required this.title,
    required this.date,
    required this.time,
    required this.color,
  });
}
