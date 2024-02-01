import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.pink])),
      ),
      centerTitle: true,
      title: const Text(
        'Your Profile',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
