import 'package:csc_picker_i18n/csc_picker.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Screens/mainScreen.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/widgets/widget_textField.dart';

class DonateEditWidget extends ConsumerStatefulWidget {
  const DonateEditWidget({
    super.key,
  });

  @override
  ConsumerState<DonateEditWidget> createState() => _DonateEditWidgetState();
}

class _DonateEditWidgetState extends ConsumerState<DonateEditWidget> {
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
    Navigator.pop(context);
  }

  String stateValue = '';
  String countryValue = '';
  String cityValue = '';
  String bloodGroup = 'A+ve';
  bool isEdit = false;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Want To Edit Profile'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.pink,
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              defaultCountry: CscCountry.India,

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
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonorUserDataWidget extends ConsumerStatefulWidget {
  bool isAvailable;
  final String name;
  final String bloodType;
  final String city;
  final String district;
  DonorUserDataWidget({
    Key? key,
    required this.isAvailable,
    required this.name,
    required this.bloodType,
    required this.city,
    required this.district,
  }) : super(key: key);

  @override
  ConsumerState<DonorUserDataWidget> createState() =>
      _DonorUserDataWidgetState();
}

class _DonorUserDataWidgetState extends ConsumerState<DonorUserDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 100,
          ),
          child: Stack(
            alignment: const Alignment(-1, -1.1),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 11,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Patient Name :  ',
                          ),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Contact Number :  ',
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser!.phoneNumber
                                .toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Text(
                            'City/Village :  ',
                          ),
                          Text(
                            widget.city,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'State :  ',
                          ),
                          Text(
                            widget.district,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Status : ',
                          ),
                          widget.isAvailable
                              ? const Text(
                                  'You Are Donor',
                                  style: TextStyle(color: Colors.green),
                                )
                              : const Text(
                                  'You Are not A Donor',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DonateEditWidget(),
                                ),
                              );
                            },
                            child: const Text('Edit Profile'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ref
                                  .watch(
                                      bloodDonateRepositoryControllerProvider)
                                  .updateAvailabilityBlood(
                                    context,
                                    !widget.isAvailable,
                                  );
                            },
                            child: Text(
                              widget.isAvailable
                                  ? 'Not to Donate'
                                  : 'Donate Here',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              '-> Go To Home',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Card(
                  elevation: 1,
                  surfaceTintColor: Colors.red,
                  color:const Color.fromARGB(255, 255, 43, 28),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      widget.bloodType,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
