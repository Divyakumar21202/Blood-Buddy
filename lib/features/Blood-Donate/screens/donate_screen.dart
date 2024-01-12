import 'package:csc_picker_i18n/csc_picker.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/widgets/widget_textField.dart';

class DonateScreen extends ConsumerStatefulWidget {
  const DonateScreen({super.key});

  @override
  ConsumerState<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends ConsumerState<DonateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final SingleValueDropDownController _dropDownController =
      SingleValueDropDownController();
  void uploadDonorInfo({
    DonorName,
    BloodGroup,
    city,
    District,
  }) {
    ref.read(bloodDonateRepositoryControllerProvider).uploadDonorInfo(
          context: context,
          DonorName: DonorName,
          BloodGroup: BloodGroup,
          city: city,
          District: District,
        );
  }

  String stateValue = '';
  String countryValue = '';
  String cityValue = '';
  String bloodGroup = 'A+ve';

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _bloodGroupController.dispose();
    _dropDownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'Want\'s to Donate ?',
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.red,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const Text(
              'Just Fill Detail',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: _nameController,
              hintText: 'Enter Donor Name',
            ),
            const SizedBox(
              height: 12,
            ),
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
            const SizedBox(
              height: 12,
            ),
            CSCPicker(
              showStates: true,
              showCities: true,
              flagState: CountryFlag.DISABLE,

              ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
              dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),

              ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
              disabledDropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),

              ///placeholders for dropdown search field
              countrySearchPlaceholder: "Country",
              stateSearchPlaceholder: "State",
              citySearchPlaceholder: "City",

              ///labels for dropdown
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
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {
                String DonorName = _nameController.text.trim();
                String Blood = bloodGroup;
                String city = cityValue;
                String District = stateValue;
                if (DonorName.isNotEmpty &&
                    Blood.isNotEmpty &&
                    city.isNotEmpty &&
                    District.isNotEmpty) {
                  uploadDonorInfo(
                    DonorName: DonorName,
                    BloodGroup: Blood,
                    city: city,
                    District: District,
                  );
                } else {
                  CustomSnackBar(
                    content: 'Enter Full Detail',
                    context: context,
                  ).displaySnackBar();
                }
              },
              child: const Text(
                'Upload Data',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
