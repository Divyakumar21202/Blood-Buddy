import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Auth-Screen-Widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _MobileController = TextEditingController();

  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _emailController.dispose();
    _emailController.dispose();
    _MobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
                controller: _nameController,
                hintText: 'Enter Patient Name',
                keyboardType: TextInputType.name),
            const SizedBox(
              height: 20,
            ),
            DropDownTextField(
              textFieldDecoration: const InputDecoration(
                hintText: 'Select Blood Group',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
              ),
              clearOption: false,
              textFieldFocusNode: textFieldFocusNode,
              searchFocusNode: searchFocusNode,
              // searchAutofocus: true,
              dropDownItemCount: 6,
              searchShowCursor: false,
              enableSearch: true,
              searchKeyboardType: TextInputType.number,
              dropDownList: const [
                DropDownValueModel(name: 'AB +ve', value: "value1"),
                DropDownValueModel(name: 'AB -ve', value: "value3"),
                DropDownValueModel(name: 'A +ve', value: "value5"),
                DropDownValueModel(name: 'A -ve', value: "value6"),
                DropDownValueModel(name: 'B +ve', value: "value7"),
                DropDownValueModel(name: 'B -ve', value: "value8"),
              ],
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
                controller: _emailController,
                hintText: 'Enter E-mail',
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
                controller: _MobileController,
                hintText: 'Enter Mobile Number',
                keyboardType: TextInputType.phone),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
              keyboardType: TextInputType.visiblePassword,
              isObcureTrue: true,
            ),
          ],
        ),
      ),
    );
  }
}
