import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final bloodRequestRepositoryProvider = Provider(
  (ref) => BloodRequestRepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
  ),
);
class BloodRequestRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  BloodRequestRepository(
    this.auth,
    this.firestore,
  );

  void sendRequest({
    required String receiverUid,
    required String blood,
    required String mobileNumber,
  }) async {
    String requestUid = const Uuid().v1();
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('Requests')
          .doc(requestUid)
          .set({
        'Sender': auth.currentUser!.uid,
        'Contact': auth.currentUser!.phoneNumber,
        'RBT': blood,
        'Receiver': receiverUid,
        'mobileNumber': mobileNumber,
      });

      await firestore
          .collection('users')
          .doc(receiverUid)
          .collection('Requests')
          .doc(requestUid)
          .set({
        'Sender': auth.currentUser!.uid,
        'Contact': auth.currentUser!.uid,
        'RBT': blood,
        'Receiver': receiverUid,
      });
    } catch (e) {
      throw (e.toString());
    }
  }

  Stream<List<Map<String, dynamic>>> getDonorRequestList() {
    return firestore
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('Requests')
        .snapshots()
        .asyncMap((event) {
      List<Map<String, dynamic>> mpp = [];

      for (var document in event.docs) {
        if (document.data()['sender'] != auth.currentUser!.uid) {
          mpp.add(document.data());
        }
      }
      return mpp;
    });
  }
}
/*firestore.collection('Donors').get().then((value) {
        for (var document in value.docs) {
          if (document.data()['mobileNumber'] == mobileNumber) {
            receiverUid = document.data()['uid'];
            break;
          }
        }
      });*/