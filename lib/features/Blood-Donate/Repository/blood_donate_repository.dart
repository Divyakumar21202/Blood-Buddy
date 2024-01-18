import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';

final BloodDonateRepositoryProvider = Provider(
  (ref) => BloodDonateRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class BloodDonateRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  BloodDonateRepository({
    required this.auth,
    required this.firestore,
  });

  void uploadDonorInfo({
    required BuildContext context,
    required String DonorName,
    required String BloodGroup,
    required String City,
    required String District,
  }) async {
    try {
      DonorModel donorModel = DonorModel(
        DonorName: DonorName,
        BloodGroup: BloodGroup,
        City: City,
        District: District,
        mobileNumber: auth.currentUser!.phoneNumber.toString(),
        isAvailable: false,
      );
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set(
            donorModel.toMap(),
          )
          .then((value) async {
        await firestore
            .collection('Donors')
            .doc(auth.currentUser!.phoneNumber)
            .set(
              donorModel.toMap(),
            );
      });
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  Stream<List<DonorModel>> getDonorList() {
    return firestore.collection('users').snapshots().asyncMap((event) async {
      List<DonorModel> list = [];
      for (var document in event.docs) {
        if (document.data()['mobileNumber'] != auth.currentUser!.phoneNumber) {
          list.add(
            DonorModel.fromMap(
              document.data(),
            ),
          );
        }
      }
      return list;
    });
  }

  Stream<DonorModel> getDonorDetail() {
    try {
      DonorModel currentDonor = DonorModel(
        DonorName: '',
        BloodGroup: '',
        City: '',
        District: '',
        mobileNumber: '',
        isAvailable: false,
      );

      return firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .snapshots()
          .asyncMap((event) {
        var map = event.data()!;
        currentDonor = DonorModel.fromMap(map);

        return currentDonor;
      });
    } catch (e) {
      throw (e).toString();
    }
  }

  void updateAvailabilityBlood(BuildContext context, bool available) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update({'isAvailable': available}).then((value) {});
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      ).displaySnackBar();
    }
  }
}
