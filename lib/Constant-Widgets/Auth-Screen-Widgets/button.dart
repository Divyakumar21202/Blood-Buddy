import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Colors/colors.dart';

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
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          nameButton,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
