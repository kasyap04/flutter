import 'package:flutter/material.dart';

import '../../bottomNavigation/bottomNavBarView.dart';
import '../widgets/appBarView.dart';
import '../widgets/headerSession.dart';
import '../widgets/home/carouselmain.dart';
import '../widgets/home/categoryView.dart';
import '../widgets/home/propularProductList.dart';
import '../widgets/home/searchBar.dart';

class HomePage extends StatelessWidget {
  void categoryPressed(dynamic categoryId) {
    print("$categoryId CATEGORY PRESSED");
  }

  void headerFunctionClicked() {
    print("HEADER BUTTON CLICKED");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarView(),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: [
            SearchBarView(),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            CarouselMain(),
            HeaderSession(
              header: "All Categories",
              buttonLabel: "See all",
              headerFunctionClicked: headerFunctionClicked,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryView(
                    label: "Fasion",
                    icon: Icons.people_alt,
                    categoryPressed: () => categoryPressed(1)),
                CategoryView(
                    label: "Electronics",
                    icon: Icons.desktop_mac,
                    categoryPressed: () => categoryPressed(2)),
                CategoryView(
                    label: "Grocery",
                    icon: Icons.shopping_bag_rounded,
                    categoryPressed: () => categoryPressed(3)),
                CategoryView(
                    label: "Pharmacy",
                    icon: Icons.medication_liquid,
                    categoryPressed: () => categoryPressed(4)),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            HeaderSession(
              header: "Popular Products",
              buttonLabel: "See all",
              headerFunctionClicked: headerFunctionClicked,
            ),
            PopulartPorductView(),
            // const Padding(padding: EdgeInsets.only(bottom: 40)),
          ],
        ),
        bottomNavigationBar: BottomNavBarView(),
      ),
    );
  }
}
