import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';
import 'package:uuid/uuid.dart';

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
      String Uid = Uuid().v1();
      DonorModel donorModel = DonorModel(
        DonorName: DonorName,
        BloodGroup: BloodGroup,
        City: City,
        District: District,
        mobileNumber: auth.currentUser!.phoneNumber.toString(),
      );
      firestore.collection('Donors').doc(Uid).set(
            donorModel.toMap(),
          );
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  Stream<List<DonorModel>> getDonorList() {
    return firestore.collection('Donors').snapshots().asyncMap((event) async {
      List<DonorModel> list = [];
      for (var document in event.docs) {
        list.add(
          DonorModel.fromMap(
            document.data(),
          ),
        );
      }
      return list;
    });
  }
}
