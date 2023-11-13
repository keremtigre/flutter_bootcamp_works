import 'package:flutter/material.dart';
import 'package:odev5/Extansions/context_extansions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String resultText = "0";
  List<String> buttons = [
    "1",
    "2",
    "3",
    "AC",
    "4",
    "5",
    "6",
    "+",
    "7",
    "8",
    "9",
    "=",
    "0",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          alignment: Alignment.bottomRight,
          color: Colors.black.withOpacity(0.8),
          height: context.height * .40,
          width: double.infinity,
          child: Text(
            resultText,
            style: const TextStyle(color: Colors.white, fontSize: 60),
          ),
        ),
        Container(
          height: context.height * .60,
          width: double.infinity,
          color: Colors.transparent.withOpacity(0.8),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return createButtons(buttons[index]);
            },
          ),
        ),
      ],
    ));
  }

  Widget createButtons(String button) {
    Color? color;
    if (button == "AC") {
      color = const Color.fromRGBO(55, 40, 48, 1).withOpacity(0.6);
    } else if (button == "+" || button == "=") {
      color = const Color.fromRGBO(253, 141, 14, 1);
    } else {
      color = const Color.fromRGBO(86, 84, 83, 1);
    }
    return GestureDetector(
      onTap: () {
        if (button == "AC") {
          setState(() {
            resultText = "0";
          });
        } else if (button == "=") {
          calculate();
        } else {
          setState(() {
            if (resultText == "0") {
              resultText = button;
            } else {
              resultText += button;
            }
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          button,
          style: const TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    );
  }

  calculate() {
    var result = 0;
    var resultSplit = resultText.split("+");
    for (var element in resultSplit) {
      result += int.tryParse(element) ?? 0;
    }
    resultText = result.toString();
    setState(() {});
  }
}
