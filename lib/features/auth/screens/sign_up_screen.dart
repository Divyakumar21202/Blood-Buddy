import 'package:csc_picker_i18n/csc_picker.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/button.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
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
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _MobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

  String stateValue = '';
  String countryValue = '';
  String cityValue = '';
  String bloodGroup = 'A+ve';
  final SingleValueDropDownController _dropDownController =
      SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  void uploadUserModel(UserModel userModel) {
    ref.read(authRepositoryControllerProvider).uploadUserModel(
          userModel: userModel,
          context: context,
        );
  }

  @override
  void setState(VoidCallback fn) {
    _MobileController.text = widget.mobileNumber!;
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    // _passwordController.dispose();
    _nameController.dispose();
    _MobileController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _dropDownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Fill the Detail',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),

                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),

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
                        CustomSnackBar(
                          content: value.toString(),
                          context: context,
                        ).displaySnackBar();
                      }
                      return value;
                    },
                    dropDownItemCount: 9,
                    onChanged: (dynamic value) {
                      bloodGroup = value
                          .toString()
                          .replaceAll('DropDownValueModel', '')
                          .replaceAll('(', '')
                          .replaceAll(')', '');
                      bloodGroup = bloodGroup
                          .substring(bloodGroup.indexOf(',') + 1)
                          .trim()
                          .toString();
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
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      String name = _nameController.text.trim();
                      String city = cityValue;
                      String district = stateValue;
                      if (name.length < 5) {
                        CustomSnackBar(
                          content: 'Enter Full Name',
                          context: context,
                        ).displaySnackBar();
                      } else if (city.length < 4) {
                        CustomSnackBar(
                          content: 'Enter Full City Name',
                          context: context,
                        ).displaySnackBar();
                      } else if (district.length < 5) {
                        CustomSnackBar(
                          content: 'Enter Full District Name',
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
                        );

                        uploadUserModel(
                          userModel,
                        );
                      }
                    },
                    child: const AuthButton(
                      nameButton: 'Sign Up',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
