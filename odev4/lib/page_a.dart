import 'package:flutter/material.dart';
import 'package:odev4/page_b.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page A",style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageB(),
                    ));
          },
          child: const Text("GO > B",style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
