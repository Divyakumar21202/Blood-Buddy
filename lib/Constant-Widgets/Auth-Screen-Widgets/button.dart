import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String nameButton;
  const AuthButton({super.key, required this.nameButton});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red[300],
      ),
      child: Center(
        child: Text(nameButton),
      ),
    );
  }
}
