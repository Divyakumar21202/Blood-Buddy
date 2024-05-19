import 'package:csc_picker_i18n/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/button.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';
import 'package:smart_odisha_blood/Screens/split_app_screen.dart';
import 'package:smart_odisha_blood/common/custom_snackbar.dart';
import 'package:smart_odisha_blood/dropdown_textfield.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';
import 'package:smart_odisha_blood/features/auth/screens/login_screen.dart';
import 'package:smart_odisha_blood/models/user_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  final String? mobileNumber;

  const SignUpScreen({
    super.key,
    required,
    this.mobileNumber,
  });

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _MobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String stateValue = '';
  String countryValue = '';
  String cityValue = '';
  String? bloodGroup;
  final SingleValueDropDownController _dropDownController =
      SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  void uploadUserModel(UserModel userModel) async {
    context.loaderOverlay.show();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('password', userModel.password.trim());
    ref
        .read(authRepositoryControllerProvider)
        .uploadUserModel(
          userModel: userModel,
        )
        .then((value) {
      context.loaderOverlay.hide();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SplitAppScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      CustomSnackBar(content: error.toString(), context: context)
          .displaySnackBar();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _MobileController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _dropDownController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.8),
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: const Text('Time To Sign-Up'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Fill the Detail',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      controller: _nameController,
                      hintText: 'Username',
                      onChange: (val) {},
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                    CSCPicker(
                      showStates: true,
                      showCities: true,

                      flagState: CountryFlag.DISABLE,

                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),

                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),

                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",
                      defaultCountry: CscCountry.India,
                      countryDropdownLabel: "*Country",
                      stateDropdownLabel: "*State",
                      cityDropdownLabel: "*City",
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///triggers once country selected in dropdown
                      onCountryChanged: (value) {
                        if (value != null) {
                          setState(() {
                            ///store value in country variable
                            countryValue = value;
                          });
                        }
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        if (value != null) {
                          setState(() {
                            ///store value in country variable
                            stateValue = value;
                          });
                        }
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        if (value != null) {
                          setState(() {
                            ///store value in country variable
                            cityValue = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: widget.mobileNumber,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropDownTextField(
                      controller: _dropDownController,
                      validator: (String? value) {
                        if (value != null) {
                          bloodGroup = value;
                          setState(() {});
                        }
                        return 'Required Field';
                      },
                      dropDownItemCount: 9,
                      onChanged: (dynamic value) {
                        if (value.runtimeType == DropDownValueModel) {
                          bloodGroup = value.value;
                        } else {
                          bloodGroup = null;
                        }
                        setState(() {});
                      },
                      textFieldDecoration: InputDecoration(
                        hintText: 'Select Blood',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      dropDownList: const [
                        DropDownValueModel(
                          name: 'A+ve',
                          value: 'A+ve',
                        ),
                        DropDownValueModel(
                          name: 'B+ve',
                          value: 'B+ve',
                        ),
                        DropDownValueModel(
                          name: 'AB+ve',
                          value: 'AB+ve',
                        ),
                        DropDownValueModel(
                          name: 'A-ve',
                          value: 'A-ve',
                        ),
                        DropDownValueModel(
                          name: 'A+ve',
                          value: 'A+ve',
                        ),
                        DropDownValueModel(
                          name: 'B-ve',
                          value: 'B-ve',
                        ),
                        DropDownValueModel(
                          name: 'AB-ve',
                          value: 'AB-ve',
                        ),
                        DropDownValueModel(
                          name: 'O+ve',
                          value: 'O+ve',
                        ),
                        DropDownValueModel(
                          name: 'O-ve',
                          value: 'O-ve',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      controller: _passwordController,
                      onChange: (val) {},
                      hintText: 'Enter Password',
                      keyboardType: TextInputType.text,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        String name = _nameController.text.trim();
                        String city = cityValue;
                        String district = stateValue;
                        String password = _passwordController.text.trim();
                        if (name.length < 5) {
                          CustomSnackBar(
                            content: 'Enter Full Name',
                            context: context,
                          ).displaySnackBar();
                        } else if (city.isEmpty) {
                          CustomSnackBar(
                            content: 'Enter Full City Name',
                            context: context,
                          ).displaySnackBar();
                        } else if (district.isEmpty) {
                          CustomSnackBar(
                            content: 'Enter Full District Name',
                            context: context,
                          ).displaySnackBar();
                        } else if (password.length <= 5) {
                          CustomSnackBar(
                            content: 'Enter Password with length more than 5',
                            context: context,
                          ).displaySnackBar();
                        } else if (bloodGroup == null) {
                          CustomSnackBar(
                            content: 'Pls Select Your Blood',
                            context: context,
                          ).displaySnackBar();
                        } else {
                          UserModel userModel = UserModel(
                              name: name,
                              uid: FirebaseAuth.instance.currentUser!.uid,
                              mobileNumber: widget.mobileNumber!,
                              district: district,
                              city: city,
                              isAvailable: false,
                              password: password,
                              bloodGroup: bloodGroup!,
                              latitude: '',
                              longitude: '');
                          uploadUserModel(
                            userModel,
                          );
                        }
                      },
                      child: const AuthButton(
                        nameButton: 'Sign Up',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Register ? Click Here',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.red[400],
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
