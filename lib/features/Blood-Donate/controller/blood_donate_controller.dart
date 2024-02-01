import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_odisha_blood/features/Blood-Donate/Repository/blood_donate_repository.dart';
import 'package:smart_odisha_blood/models/user_model.dart';

final bloodDonateRepositoryControllerProvider = Provider((ref) {
  BloodDonateRepository bloodDonateRepository = ref.watch(
    BloodDonateRepositoryProvider,
  );
  return bloodDonateRepositoryController(
    bloodDonateRepository: bloodDonateRepository,
  );
});

class bloodDonateRepositoryController {
  final BloodDonateRepository bloodDonateRepository;
  bloodDonateRepositoryController({
    required this.bloodDonateRepository,
  });

  void uploadDonorInfo({
    required BuildContext context,
    required String DonorName,
    required String BloodGroup,
    required String city,
    required String District,
    required String password,
  }) {
    bloodDonateRepository.uploadDonorInfo(
      context: context,
      DonorName: DonorName,
      bloodGroup: BloodGroup,
      City: city,
      District: District,
      password: password,
    );
  }

  Stream<List<UserModel>> getDonorList() {
    return bloodDonateRepository.getDonorList();
  }

  Stream<UserModel> getDonorDetail() {
    return bloodDonateRepository.getDonorDetail();
  }

  void updateAvailabilityBlood(BuildContext context, bool available) {
    return bloodDonateRepository.updateAvailabilityBlood(context, available);
  }

  void updateBloodCount() {
    bloodDonateRepository.bloodCount();
  }
}
