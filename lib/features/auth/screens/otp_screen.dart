import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/custom_snackbar.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String mobileNumber;
  final String identificationId;
  final bool isLogin;
  const OtpScreen({
    super.key,
    required this.mobileNumber,
    required this.identificationId,
     this.isLogin = true ,
  });

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void verifyOtp(String Code) {
    ref.watch(authRepositoryControllerProvider).verifyOtp(
          context,
          widget.identificationId,
          Code,
          widget.isLogin,
          widget.mobileNumber,
        );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: size.height * 0.2),
          const Text(
            'We have Sent SMS with Code',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.5,
            child: TextField(
              controller: _controller,
              style: const TextStyle(
                fontSize: 23,
              ),
              maxLength: 6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "- - - - - -",
                hintStyle: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              String code = _controller.text.trim();
              if (code.length == 6) {
                CustomSnackBar(
                  content: code,
                  context: context,
                );
                verifyOtp(
                  code,
                );
              } else {
                CustomSnackBar(
                  content: 'Enter correct Otp',
                  context: context,
                ).displaySnackBar();
              }
            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}