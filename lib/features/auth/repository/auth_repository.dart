// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_odisha_blood/Screens/split_app_screen.dart';
import 'package:smart_odisha_blood/common/custom_snackbar.dart';
import 'package:smart_odisha_blood/features/auth/screens/otp_screen.dart';
import 'package:smart_odisha_blood/features/auth/screens/sign_up_screen.dart';
import 'package:smart_odisha_blood/models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    ref: ref,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final ProviderRef ref;

  AuthRepository({
    required this.auth,
    required this.firestore,
    required this.ref,
  });

  Future<UserCredential?> signInWithGoogle() async {
    final _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential cd =
            await FirebaseAuth.instance.signInWithCredential(credential);

        print(FirebaseAuth.instance.currentUser!.uid.toString());
        return cd;
      }
      return null; // User canceled Google sign-in
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  void verifyUser(String phoneNumber, BuildContext context) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          CustomSnackBar(content: e.toString(), context: context)
              .displaySnackBar();
        },
        codeSent: (
          String identificationId,
          int? code,
        ) async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                isLogin: false,
                identificationId: identificationId,
                mobileNumber: phoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (val) {},
      );
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String VerificationId,
    required String SmsCode,
    required bool isLogin,
    required String mobileNumber,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId,
        smsCode: SmsCode,
      );

      await auth
          .signInWithCredential(
        credential,
      )
          .then((value) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('uid', auth.currentUser!.uid.toString());

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => isLogin
                ? const SplitAppScreen()
                : SignUpScreen(
                    mobileNumber: mobileNumber,
                  ),
          ),
        );
      });
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  void uploadUserModel({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(userModel.uid)
          .set(
            userModel.toMap(),
          )
          .whenComplete(
            () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SplitAppScreen(),
              ),
              (route) => false,
            ),
          );
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  Future<Map<String, dynamic>?> getUserModel({
    required BuildContext context,
    required String mobileNumber,
  }) async {
    Map<String, dynamic> doc = UserModel(
      name: '',
      uid: '',
      mobileNumber: '',
      district: '',
      city: '',
      isAvailable: false,
      password: '',
      bloodGroup: '',
      latitude: '',
      longitude: '',
    ).toMap();
    try {
      await firestore.collection('users').get().then((value) {
        doc = value.docs
            .singleWhere(
                (element) => element.data()['mobileNumber'] == mobileNumber)
            .data();
      });
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
    return doc;
  }

  Future LoginWithPhone({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          auth.signInWithCredential(
            credential,
          );
        },
        verificationFailed: (val) {
          CustomSnackBar(
            content: val.toString(),
            context: context,
          ).displaySnackBar();
        },
        codeSent: (String IdentificationId, int? code) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                isLogin: true,
                identificationId: IdentificationId,
                mobileNumber: phoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (val) {},
      );
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      ).displaySnackBar();
    }
  }

  void uploadUserlocation({
    required String latitude,
    required String longitude,
    required BuildContext context,
  }) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'latitude': latitude,
        'longitude': longitude,
      });
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      ).displaySnackBar();
    }
  }
}
