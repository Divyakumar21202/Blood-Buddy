import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/models/user_model.dart';
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
      // await firestore
      //     .collection('users')
      //     .doc(auth.currentUser!.uid)
      //     .collection('Requests')
      //     .doc(mobileNumber)
      //     .set({
      //   'Sender': auth.currentUser!.uid,
      //   'Contact': auth.currentUser!.phoneNumber,
      //   'RBT': blood,
      //   'Receiver': receiverUid,
      //   'mobileNumber': mobileNumber,
      // });

      await firestore
          .collection('Donors')
          .doc(mobileNumber)
          .collection('Requests')
          .doc(requestUid)
          .set({
        'Sender': auth.currentUser!.phoneNumber,
        'Contact': mobileNumber,
        'RBT': blood,
      });
    } catch (e) {
      throw (e.toString());
    }
  }

  // Stream<List<Map<String, dynamic>>> getDonorRequestListX() {
  //   return firestore
  //       .collection('Donors')
  //       .doc(auth.currentUser!.phoneNumber)
  //       .collection('Requests')
  //       .snapshots()
  //       .asyncMap((event) {
  //     List<Map<String, dynamic>> mpp = [];
  //     for (var document in event.docs) {
  //       if (document.data()['sender'] != auth.currentUser!.uid) {
  //         mpp.add(document.data());
  //       }
  //     }
  //     return mpp;
  //   });
  // }

  void storeUserRequests({
    required BuildContext context,
    required String number,
    required String blood,
  }) async {
    try {
      firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) {
        String docId = const Uuid().v1();
        Map<String, dynamic> model = value.data()!;
        String name = model['DonorName'];
        firestore
            .collection('Donors')
            .doc(number)
            .collection('Requests')
            .doc(docId)
            .set({
          'name': name,
          'contact': auth.currentUser!.phoneNumber,
          'blood': blood,
        });
      });
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      ).displaySnackBar();
    }
  }

  Stream<List<Map<String, dynamic>>> getDonorRequestList() {
    return firestore
        .collection('Donors')
        .doc(auth.currentUser!.phoneNumber)
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
