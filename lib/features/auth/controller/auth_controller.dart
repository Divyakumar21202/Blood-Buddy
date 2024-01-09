// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_odisha_blood/features/auth/repository/auth_repository.dart';

final authRepositoryControllerProvider = Provider((ref) {
  AuthRepository authRepository = ref.read(authRepositoryProvider);
  return AuthRepositoryController(authRepository: authRepository);
});

class AuthRepositoryController {
  final AuthRepository authRepository;
  AuthRepositoryController({
    required this.authRepository,
  });

  void verifyUserMobile(String phoneNumber, BuildContext context) {
    authRepository.verifyUser(phoneNumber, context);
  }

  void verifyOtp(BuildContext context, String verificationId, String smsCode) {
    authRepository.verifyOtp(
      context: context,
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }

  void SigninWithGmail(
    BuildContext context,
    String email,
    String,
    String password,
  ) {
    authRepository.signUpwithGmail(
      context,
      email,
      password,
    );
  }
}
