import 'package:bingo/home/startButton.dart';
import 'package:flutter/material.dart';

import './bingoTable.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bingo Game",
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "BINGO",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          body: ListView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Stack(textDirection: TextDirection.rtl, children: [
                Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    width: 130,
                    child: StartButtomn())
              ]),
              BingoTable(),
              // OutlinedButton(
              //   onPressed: (){},
              //   style: OutlinedButton.styleFrom(
              //     padding: const EdgeInsets.all(12),
              //     primary: const Color.fromARGB(255, 128, 128, 128),
              //     textStyle: const TextStyle(fontSize: 22, color: Colors.grey),
              //   ),
              //   child: const Text("Shuffle numbers"),
              // )
            ],
          )),
    );
  }
}
