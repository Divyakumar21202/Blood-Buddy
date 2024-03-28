import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
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
    this.isLogin = true,
  });

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isConfirm = false;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void verifyOtp(String code) {
    ref.watch(authRepositoryControllerProvider).verifyOtp(
          context,
          widget.identificationId,
          code,
          widget.isLogin,
          widget.mobileNumber,
        );
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.redAccent;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.red;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Blood Buddy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'A perfect blood Solution',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      'We have Sent an Sms To \n ${widget.mobileNumber} ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Pinput(
                      controller: _controller,
                      length: 6,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        setState(() {
                          isConfirm = true;
                        });
                      },
                      onChanged: (val) {
                        if (val.length != 6) {
                          setState(() {
                            isConfirm = false;
                          });
                        }
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                    const SizedBox(height: 17),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Didn\'t get an otp ? '),
                        SizedBox(width: 10),
                        Text('New Otp'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    isConfirm
                        ? SizedBox(
                            width: size.width - size.width * 0.1,
                            child: ElevatedButton(
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
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
