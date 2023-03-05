import 'package:flutter/material.dart';

import '../../colors.dart';

class AppBarView extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<AppBarView> createState() => AppBarViewState();
}

class AppBarViewState extends State<AppBarView> {
  void cartClicked() {
    print("CART CLICKED");
  }

  void notificationClicked() {
    print("Notification clicked");
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CartView(cartIconPressed: cartClicked),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Stack(
          children: [
            NotificationView(
              notificationIconPressed: notificationClicked,
            ),
            Positioned(top: 16, left: 26, child: NotificationDot())
          ],
        )
      ],
    );
  }
}

class NotificationDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Visibility(
      visible: true,
      child: Container(
        height: 6,
        width: 6,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(50)),
      ));
}

class NotificationView extends StatelessWidget {
  final void Function() notificationIconPressed;
  NotificationView({required this.notificationIconPressed});

  @override
  Widget build(BuildContext context) => IconButton(
      onPressed: notificationIconPressed,
      icon: Icon(
        Icons.notifications_none_outlined,
        color: Colors.black,
      ));
}

class CartView extends StatelessWidget {
  final void Function() cartIconPressed;
  CartView({required this.cartIconPressed});
  @override
  Widget build(BuildContext context) => IconButton(
      onPressed: cartIconPressed,
      icon: Icon(
        Icons.shopping_bag,
        color: AppColor().primaryBlue,
      ));
}
