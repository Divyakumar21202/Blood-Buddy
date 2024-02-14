import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';
import 'package:smart_odisha_blood/features/auth/screens/registerScreen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _MobileController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _MobileController.dispose();
  }

  void confirmUser(
    String mobileNumber,
    String password,
  ) async {
    CustomSnackBar(
      content: mobileNumber,
      context: context,
    ).displaySnackBar();

    var model = ref.watch(authRepositoryControllerProvider).getUserModel(
          context: context,
          mobileNumber: '+91${mobileNumber}',
        );
    model.then((value) {
      if (value == null) {
        CustomSnackBar(
          content: 'Number Not Exist\'s',
          context: context,
        ).displaySnackBar();
      }
      if (value != null) {
        if (value['password'] == password) {
          ref.read(authRepositoryControllerProvider).LoginWithPhone(
                context: context,
                phoneNumber: '+91${mobileNumber}',
              );
        } else {
          CustomSnackBar(
            content: 'Enter Correct Password',
            context: context,
          ).displaySnackBar();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Image(
                  image: NetworkImage(
                    'https://st.depositphotos.com/1035986/2121/v/380/depositphotos_21214343-stock-illustration-blood-donation.jpg',
                  ),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Blood-Buddy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'Welcome Back !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                AuthTextField(
                  controller: _MobileController,
                  hintText: 'Enter Mobile Number',
                  keyboardType: TextInputType.phone,
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: _passwordController,
                  hintText: 'Enter Password',
                  keyboardType: TextInputType.visiblePassword,
                  onChange: (value) {},
                  isObcureTrue: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    String password = _passwordController.text.trim();
                    String mobileNumber = _MobileController.text.trim();
                    if (mobileNumber.length != 10) {
                      CustomSnackBar(
                        content: 'Enter Mobile Number',
                        context: context,
                      ).displaySnackBar();
                    } else if (password.isEmpty) {
                      CustomSnackBar(
                        content: 'Enter Password',
                        context: context,
                      ).displaySnackBar();
                    } else {
                      confirmUser(
                        mobileNumber,
                        password,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an Account ?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
