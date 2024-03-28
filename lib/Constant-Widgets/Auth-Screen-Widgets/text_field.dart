import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final ValueChanged<String> onChange;
  final bool isPassword;
  final String hintText;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.onChange,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isVisible,
      keyboardType: widget.keyboardType,
      onSubmitted: (val) {
        widget.onChange(val);
      },
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off_outlined,
                ),
              )
            : null,
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
      ),
      controller: widget.controller,
    );
  }
}
