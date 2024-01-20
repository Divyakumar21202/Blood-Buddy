import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_odisha_blood/features/Blood-Donate/Repository/blood_donate_repository.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';

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
  }) {
    bloodDonateRepository.uploadDonorInfo(
      context: context,
      DonorName: DonorName,
      BloodGroup: BloodGroup,
      City: city,
      District: District,
    );
  }

  Stream<List<DonorModel>> getDonorList() {
    return bloodDonateRepository.getDonorList();
  }

  Stream<DonorModel> getDonorDetail() {
    return bloodDonateRepository.getDonorDetail();
  }

  void updateAvailabilityBlood(BuildContext context, bool available) {
    return bloodDonateRepository.updateAvailabilityBlood(context, available);
  }

  void updateBloodCount() {
    bloodDonateRepository.bloodCount();
  }
}
