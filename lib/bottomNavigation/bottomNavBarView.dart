import 'package:flutter/material.dart';
import 'package:ridhiks/colors.dart';

class BottomNavBarView extends StatefulWidget {
  @override
  State<BottomNavBarView> createState() => BottomNavBarViewState();
}

class BottomNavBarViewState extends State<BottomNavBarView> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined), label: "Categories"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined), label: "Profile"),
      ],
      backgroundColor: Colors.grey,
      elevation: 0,
      selectedItemColor: AppColor().primaryBlue,
      unselectedItemColor: AppColor().colorGrye,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
