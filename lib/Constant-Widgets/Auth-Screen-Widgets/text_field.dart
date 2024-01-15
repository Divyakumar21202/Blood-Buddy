import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObcureTrue;
  final TextInputType keyboardType;
  final ValueChanged<String> onChange;
  final String hintText;
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.hintText,
      required this.keyboardType,
      this.isObcureTrue = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: isObcureTrue,
        keyboardType: keyboardType,
        onSubmitted: (val) {
          onChange(val);
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
