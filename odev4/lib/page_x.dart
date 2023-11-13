import 'package:flutter/material.dart';
import 'package:odev4/page_y.dart';

class PageX extends StatelessWidget {
  const PageX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Page X",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageY(),
                ));
          },
          child: const Text(
            "GO > Y",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
