// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TableInputChild extends StatefulWidget {
  final bool isEven;
  final String cellNum;

  TableInputChild({required this.isEven, required this.cellNum});

  @override
  _TableInputChildState createState() =>
      _TableInputChildState(isEven: isEven, cellNum: cellNum);
}

class _TableInputChildState extends State<TableInputChild> {
  final Color oddColor = const Color.fromARGB(48, 226, 80, 80);
  final Color evenColor = const Color.fromARGB(94, 48, 138, 161);

  final bool isEven;
  final String cellNum;

  _TableInputChildState({required this.isEven, required this.cellNum});

  final TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.text = cellNum;
  }

  void _validateField(String text) {
    if (text.length != 0) {
      try {
        int num = int.parse(text);
        if (num <= 0 || num > 25) {
          myController.clear();
        }
      } catch (e) {
        myController.clear();
      }
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print (cellNum);
    return Container(
      // height: screenSize.width / 5,
      // width: screenSize.width / 5,
      decoration: BoxDecoration(
          color: isEven ? evenColor : oddColor,
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: screenSize.width / 5,
        // width: screenSize.width / 5,
        child: TextField(
          controller: myController,
          onChanged: (String text) {
            setState(() {
              _validateField(text);
            });
          },
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 30),
          keyboardType: TextInputType.number,
          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          toolbarOptions: const ToolbarOptions(selectAll: false),
          enableSuggestions: false,
          decoration: const InputDecoration(
            filled: true,
            // fillColor: Colors.green,
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
