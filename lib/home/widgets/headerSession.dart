import 'package:flutter/material.dart';

import '../../colors.dart';

class HeaderSession extends StatelessWidget {
  final String header;
  final String buttonLabel;
  final void Function() headerFunctionClicked;
  HeaderSession(
      {required this.header,
      required this.buttonLabel,
      required this.headerFunctionClicked});
  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(header,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: headerFunctionClicked,
            child: Text(
              buttonLabel,
              style: TextStyle(
                  color: AppColor().primaryBlue, fontWeight: FontWeight.bold),
            ))
      ]);
}
