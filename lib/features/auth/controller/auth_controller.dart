import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/features/auth/repository/auth_repository.dart';
import 'package:smart_odisha_blood/models/user_model.dart';

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

  void verifyOtp(BuildContext context, String VerificationId, String SmsCode,
      bool isLogin, String mobileNumber) {
    authRepository.verifyOtp(
      context: context,
      VerificationId: VerificationId,
      SmsCode: SmsCode,
      isLogin: isLogin,
      mobileNumber: mobileNumber,
    );
  }

  void uploadUserModel({
    required BuildContext context,
    required UserModel userModel,
  }) {
    authRepository.uploadUserModel(
      context: context,
      userModel: userModel,
    );
  }

  Future<Map<String, dynamic>?> getUserModel({
    required BuildContext context,
    required String mobileNumber,
  }) {
    return authRepository.getUserModel(
      context: context,
      mobileNumber: mobileNumber,
    );
  }

  void LoginWithPhone({
    required BuildContext context,
    required String phoneNumber,
  }) {
    authRepository.LoginWithPhone(
      context: context,
      phoneNumber: phoneNumber,
    );
  }

  void uploadUserlocation({
    required String latitude,
    required String longitude,
    required BuildContext context,
  }) {
    authRepository.uploadUserlocation(
      latitude: latitude,
      longitude: longitude,
      context: context,
    );
  }
}
