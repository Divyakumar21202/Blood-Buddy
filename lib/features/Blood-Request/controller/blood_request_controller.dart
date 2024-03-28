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
  // void sendRequest(
  //     String blood, String mobileNumber, String name, String receiverUid) {
  //   bloodRequestRepository.sendRequest(
  //     blood: blood,
  //     mobileNumber: mobileNumber,
  //     receiverUid: receiverUid,
  //   );
  // }

  Stream<List<Map<String, dynamic>>> getDonorRequestList() {
    return bloodRequestRepository.getDonorRequestList();
  }

  // void storeUserRequests({
  //   required BuildContext context,
  //   required String uid,
  //   required String blood,
  // }) {
  //   bloodRequestRepository.storeUserRequests(
  //     context: context,
  //     uid: uid,
  //     blood: blood,
  //   );
  // }
}
