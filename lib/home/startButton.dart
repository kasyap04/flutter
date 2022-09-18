import 'package:flutter/material.dart';

class StartButtomn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("hello");
      },
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          primary: const Color.fromARGB(255, 12, 102, 114),
          onPrimary: Colors.white,
          fixedSize: const Size(120, 50)),
      child: const Text(
        "START",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }
}
