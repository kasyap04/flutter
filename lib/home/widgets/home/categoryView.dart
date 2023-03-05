import 'package:flutter/material.dart';
import 'package:ridhiks/colors.dart';

class CategoryView extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() categoryPressed;
  CategoryView(
      {required this.label, required this.icon, required this.categoryPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: categoryPressed,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: AppColor().primaryBlueMild,
                borderRadius: BorderRadius.circular(6)),
            child: Icon(
              icon,
              color: AppColor().primaryBlue,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        Text(
          label,
          style: TextStyle(
              color: AppColor().primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        )
      ],
    );
  }
}
