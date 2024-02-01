import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/button.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void register() {
    String phoneNumber = '+91${_controller.text.trim()}';
    if (phoneNumber.length == 13) {
      ref.read(authRepositoryControllerProvider).verifyUserMobile(
            phoneNumber,
            context,
          );
    } else {
      CustomSnackBar(
        content: 'Enter Valid Mobile Number',
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 200,
            ),
            AuthTextField(
              controller: _controller,
              onChange: (val) {},
              hintText: 'Enter Mobile Number',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 23,
            ),
            InkWell(
              onTap: () {
                register();
              },
              child: const AuthButton(
                nameButton: 'Confirm',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
