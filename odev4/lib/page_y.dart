import 'package:flutter/material.dart';

class PageY extends StatelessWidget {
  const PageY({super.key});
  //geri tuşu kullanıldığında ana sayfaya gidecek ve arkadaki sayfaları silecek.
  Future<bool> onWillPop(BuildContext context) async {
    Navigator.popUntil(context, (route) => route.isFirst);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Y"),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: const Center(
          child: Text(
            "Return to the main page with the back button.",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
