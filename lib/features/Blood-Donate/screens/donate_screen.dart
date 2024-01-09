import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _bloodGroupController.dispose();
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
            TextFieldWidget(
              hintText: 'Blood Group',
              controller: _bloodGroupController,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldWidget(
              hintText: 'Village or City Name',
              controller: _cityController,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldWidget(
              hintText: 'District Name',
              controller: _districtController,
            ),
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {
                String DonorName = _nameController.text.trim();
                String BloodGroup = _bloodGroupController.text.trim();
                String city = _cityController.text.trim();
                String District = _districtController.text.trim();
                if (DonorName.isNotEmpty &&
                    BloodGroup.isNotEmpty &&
                    city.isNotEmpty &&
                    District.isNotEmpty) {
                  uploadDonorInfo(
                    DonorName: DonorName,
                    BloodGroup: BloodGroup,
                    city: city,
                    District: District,
                  );
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
