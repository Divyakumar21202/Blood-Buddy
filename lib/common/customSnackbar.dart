import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSnackBar {
  final String content;
  final BuildContext context;
  const CustomSnackBar({
    required this.content,
    required this.context,
  });
  void displaySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
