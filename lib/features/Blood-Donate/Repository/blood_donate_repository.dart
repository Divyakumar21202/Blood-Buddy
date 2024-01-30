import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/models/blood_info.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';

final BloodDonateRepositoryProvider = Provider(
  (ref) => BloodDonateRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    ref: ref,
  ),
);

class BloodDonateRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final ProviderRef ref;
  BloodDonateRepository({
    required this.auth,
    required this.firestore,
    required this.ref,
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

  void bloodCount() async {
    BloodInfoModel model = BloodInfoModel(
      ap: 0,
      abp: 0,
      bp: 0,
      an: 0,
      bn: 0,
      abn: 0,
      op: 0,
      on: 0,
    );
    await firestore.collection('users').get().then((event) {
      for (var document in event.docs) {
        switch (document.data()['BloodGroup']) {
          case 'A+ve':
            model.ap = model.ap + 1;
            break;
          case 'AB+ve':
            model.abp = model.abp + 1;
            break;
          case 'A-ve':
            model.an = model.an + 1;
            break;
          case 'AB-ve':
            model.abn = model.abn + 1;
            break;
          case 'B+ve':
            model.bp = model.bp + 1;
            break;
          case 'B-ve':
            model.bn = model.bn + 1;
            break;
          case 'O+ve':
            model.op = model.op + 1;
            break;
          default:
            model.on = model.on + 1;
        }
        ref.watch(bloodInfoModelProvider.notifier).update((state) => model);
      }
    });
  }
}
