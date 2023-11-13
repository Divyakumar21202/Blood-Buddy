import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/button.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _MobileController = TextEditingController();

  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _emailController.dispose();
    _emailController.dispose();
    _MobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
            flex: 2,
            child: Container(),
          ),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
                controller: _MobileController,
                hintText: 'Enter Mobile Number',
                keyboardType: TextInputType.phone),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
              keyboardType: TextInputType.visiblePassword,
              isObcureTrue: true,
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthButton(nameButton: 'Login'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forget Password ? ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Click Here !',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
             Flexible(
            flex: 2,
            child: Container(),
          ),
          ],
        ),
      ),
    );
  }
}
