import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:smart_odisha_blood/common/custom_snackbar.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';
import 'package:smart_odisha_blood/features/auth/screens/sign_up_screen.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Make the status bar transparent
    ));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GlobalLoaderOverlay(
          overlayColor: Colors.grey.withOpacity(0.8),
          useDefaultLoading: false,
          overlayWidgetBuilder: (_) {
            //ignored progress for the moment
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 9,
                ),
                const Text(
                  'Welcome Life Saver',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          'https://img.freepik.com/free-vector/biotechnology-isometric-composition-with-human-characters-medical-workers-with-patients-medication-lab-computer-icons-vector-illustration_1284-83228.jpg?t=st=1711707961~exp=1711711561~hmac=5faf8cd5978628967bdff208125f52280ec463e06f95c4688aa5009155f2a9bc&w=996',
                        ),
                      ),
                    ),
                  ),
                ),
                SignInButton(
                  Buttons.google,
                  onPressed: () async {
                    context.loaderOverlay.show();
                    try {
                      ref
                          .read(authRepositoryControllerProvider)
                          .signInWithGoogle()
                          .then((value) {
                        context.loaderOverlay.hide();
                        if (value != null) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>  SignUpScreen(mobileNumber: FirebaseAuth.instance.currentUser!.email,)),
                              (route) => false);
                        } else {
                          CustomSnackBar(
                                  content: 'Google Sign-In Failed',
                                  context: context)
                              .displaySnackBar();
                        }
                      }).onError((error, stackTrace) {
                        context.loaderOverlay.hide();
                        CustomSnackBar(
                                content: 'Google Sign-In Failed',
                                context: context)
                            .displaySnackBar();
                      });
                    } catch (e) {
                      context.loaderOverlay.hide();
                      CustomSnackBar(
                              content: 'Google Sign-In Failed',
                              context: context)
                          .displaySnackBar();
                    }
                  },
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
