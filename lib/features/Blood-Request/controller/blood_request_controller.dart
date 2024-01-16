import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/features/Blood-Request/Repository/blood_request_repo.dart';

final bloodRequestControllerProvider = Provider((ref) {
  final repo = ref.read(bloodRequestRepositoryProvider);
  return BloodRequestController(
    bloodRequestRepository: repo,
  );
});

class BloodRequestController {
  final BloodRequestRepository bloodRequestRepository;
  BloodRequestController({
    required this.bloodRequestRepository,
  });
  void sendRequest(String receiverUid, String blood, String mobileNumber) {
    bloodRequestRepository.sendRequest(
      receiverUid: receiverUid,
      blood: blood,
      mobileNumber: mobileNumber,
    );
  }

  Stream<List<Map<String, dynamic>>> getDonorRequestList() {
    return bloodRequestRepository.getDonorRequestList();
  }
}
