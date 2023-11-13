import 'package:flutter/material.dart';
import 'package:odev3/Models/note_model.dart';

class Data {
  static List<Note> notes = [
    Note(
        title: "Techcareer Bootcamp",
        date: "12 Octaber 2023",
        time: "19:00 PM",
        color: const Color.fromRGBO(237, 220, 254, 1)),
    Note(
        title: "Work (17)",
        date: "8 Octaber 2023",
        time: "02:43 AM",
        color: const Color.fromRGBO(245, 213, 230, 1)),
    Note(
        title: "Personal (32)",
        date: "3 Octaber 2023",
        time: "05:55 PM",
        color: const Color.fromRGBO(220, 237, 217, 1)),
    Note(
        title: "Study (9)",
        date: "2 Octaber 2023",
        time: "11:12 PM",
        color: const Color.fromRGBO(215, 230, 245, 1)),
    Note(
        title: "Shopping (5)",
        date: "26 September 2023",
        time: "12:30 PM",
        color: const Color.fromRGBO(253, 242, 190, 1)),
  ];

  static List<Icon> bottomIcons = const [
    Icon(Icons.brush),
    Icon(Icons.shopping_basket),
    Icon(Icons.mic),
    Icon(Icons.tune),
  ];

  
}

class AppColors {
  static var color1 = const Color.fromRGBO(70, 22, 178, 1);
}
