import 'package:csc_picker_i18n/csc_picker.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';

class FilterScreenSearch extends ConsumerStatefulWidget {
  final VoidCallback onClose;
  final ValueChanged onApply;
  const FilterScreenSearch({
    Key? key,
    required this.onClose,
    required this.onApply,
  }) : super(key: key);

  @override
  ConsumerState<FilterScreenSearch> createState() => _FilterScreenSearchState();
}

class _FilterScreenSearchState extends ConsumerState<FilterScreenSearch> {
  String stateValue = '';
  String cityValue = '';
  String countryValue = '';
  bool isAp = false;
  bool isBp = false;
  bool isABp = false;
  bool isAn = false;
  bool isOp = false;
  bool isABn = false;
  bool isOn = false;
  bool isBn = false;
  String bloodGroup = '';
  SingleValueDropDownController dropDownController =
      SingleValueDropDownController();

  void changeApply() {
    widget.onApply(bloodGroup);
  }

  @override
  void dispose() {
    super.dispose();
    dropDownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 12,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.red[200]!,
                Colors.pink,
              ]),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                const ListTile(
                  title: Text('Filter Options'),
                ),
                DropDownTextField(
                  controller: dropDownController,
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
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: widget.onClose,
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        changeApply();
                      },
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
