import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/button.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';
import 'package:smart_odisha_blood/common/custom_snackbar.dart';
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

  void register() async {
    String phoneNumber = '+91${_controller.text.trim()}';
    if (phoneNumber.length == 13) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
        'mobileNumber',
        _controller.text.trim().toString(),
      );
      context.loaderOverlay.show();
      ref
          .read(authRepositoryControllerProvider)
          .verifyUserMobile(
            phoneNumber,
            context,
          )
          .whenComplete(() {
        context.loaderOverlay.hide();
      }).onError((error, stackTrace) {
        context.loaderOverlay.hide();
        CustomSnackBar(content: error.toString(), context: context)
            .displaySnackBar();
      });
    } else {
      context.loaderOverlay.hide();
      CustomSnackBar(
        content: 'Enter Valid Mobile Number',
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: GlobalLoaderOverlay(
        overlayColor: Colors.black.withOpacity(0.8),
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
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
                onTap: () async {
                  register();
                },
                child: const AuthButton(
                  nameButton: 'Confirm',
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Divider(
                height: 40,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
              ),
              SignInButton(
                Buttons.google,
                onPressed: () async {
                  context.loaderOverlay.show();
                  try {
                    await ref
                        .read(authRepositoryControllerProvider)
                        .signInWithGoogle()
                        .then((value) {
                      if (value != null) {
                        context.loaderOverlay.hide();
                      } else {
                        context.loaderOverlay.hide();
                        CustomSnackBar(
                                content: 'Google Sign-In Failed',
                                context: context)
                            .displaySnackBar();
                      }
                    });
                  } catch (e) {
                    context.loaderOverlay.hide();

                    CustomSnackBar(
                            content: 'Google Sign-In Failed Network Error',
                            context: context)
                        .displaySnackBar();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
