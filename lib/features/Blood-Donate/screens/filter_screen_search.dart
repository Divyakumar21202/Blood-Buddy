// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:csc_picker_i18n/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_odisha_blood/features/Blood-Donate/widgets/filter_option_card_blood_selectBtn.dart';
import 'package:smart_odisha_blood/models/selected_filter_data.dart';

class FilterScreenSearch extends ConsumerStatefulWidget {
  final VoidCallback onClose;
  final VoidCallback onApply;
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

  void changeApply() {
    SelectFilterData selectFilterData = SelectFilterData(
      aPpositive: {'A+ve': isAp},
      bPositive: {'B+ve': isBp},
      abPositive: {'AB+ve': isABp},
      oPositive: {'O+ve': isOp},
      aNegative: {'A-ve': isAn},
      bNegative: {'B-ve': isBn},
      abNegative: {'AB-ve': isABn},
      oNegative: {'O-ve': isOn},
      country: countryValue,
      state: stateValue,
      city: cityValue,
    );
    ref.read(SelectFilterDataProvider.notifier).update(
          (state) => selectFilterData,
        );
    widget.onApply();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BloodFilterButton(
                      buttonName: 'A+ve',
                      isSelected: isAp,
                      onTap: () {
                        isAp = !isAp;
                        setState(() {});
                      },
                    ),
                    BloodFilterButton(
                      buttonName: 'B+ve',
                      isSelected: isBp,
                      onTap: () {
                        isBp = !isBp;
                        setState(() {});
                      },
                    ),
                    BloodFilterButton(
                      buttonName: 'AB+ve',
                      isSelected: isABp,
                      onTap: () {
                        isABp = !isABp;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BloodFilterButton(
                      buttonName: 'A-ve',
                      isSelected: isAn,
                      onTap: () {
                        isAn = !isAn;
                        setState(() {});
                      },
                    ),
                    BloodFilterButton(
                      buttonName: 'B-ve',
                      isSelected: isBn,
                      onTap: () {
                        isBn = !isBn;
                        setState(() {});
                      },
                    ),
                    BloodFilterButton(
                      buttonName: 'AB-ve',
                      isSelected: isABn,
                      onTap: () {
                        isABn = !isABn;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BloodFilterButton(
                      buttonName: 'O+ve',
                      isSelected: isOp,
                      onTap: () {
                        isOp = !isOp;
                        setState(() {});
                      },
                    ),
                    BloodFilterButton(
                      buttonName: 'O-ve',
                      isSelected: isOn,
                      onTap: () {
                        isOn = !isOn;
                        setState(() {});
                      },
                    ),
                    Container(),
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
