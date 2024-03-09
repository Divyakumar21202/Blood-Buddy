import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/models/blood_info.dart';
import 'package:smart_odisha_blood/models/user_model.dart';

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
    required String City,
    required String District,
    required String password,
    required String bloodGroup,
  }) async {
    try {
      UserModel donorModel = UserModel(
        name: DonorName,
        bloodGroup: bloodGroup,
        city: City,
        district: District,
        mobileNumber: auth.currentUser!.phoneNumber.toString(),
        isAvailable: false,
        uid: auth.currentUser!.uid,
        password: password,
        latitude: '',
        longitude: '',
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

  Stream<List<UserModel>> getDonorList() {
    return firestore.collection('users').snapshots().asyncMap((event) async {
      List<UserModel> list = [];
      for (var document in event.docs) {
        if (document.data()['mobileNumber'] != auth.currentUser!.phoneNumber) {
          list.add(
            UserModel.fromMap(
              document.data(),
            ),
          );
        }
      }
      return list;
    });
  }

  Stream<UserModel> getDonorDetail() {
    try {
      UserModel currentDonor = UserModel(
        name: '',
        bloodGroup: '',
        city: '',
        district: '',
        mobileNumber: '',
        isAvailable: false,
        uid: '',
        password: '',
        latitude: '',
        longitude: '',
      );

      return firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .snapshots()
          .asyncMap((event) {
        var map = event.data()!;
        currentDonor = UserModel.fromMap(map);
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
        switch (document.data()['bloodGroup']) {
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

  void makeRequest({required String mobileNumber}) {
    String uids = '';
    UserModel userModel = UserModel(
      name: 'name',
      uid: 'uid',
      mobileNumber: mobileNumber,
      district: 'district',
      city: 'city',
      isAvailable: true,
      password: 'password',
      bloodGroup: 'bloodGroup',
      latitude: '',
      longitude: '',
    );
    firestore.collection('users').get().then((value) async {
      var document = value.docs;
      for (var doc in document) {
        if (doc['mobileNumber'] == mobileNumber) {
          print(doc['uid']);
          uids = doc['uid'];
        }
      }
      // Sender and receiver both
      firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) {
        userModel = UserModel.fromMap(value.data()!);
      });

      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('requests')
          .doc(mobileNumber)
          .set({
        "name": userModel.name,
        "bloodGroup": userModel.bloodGroup,
        "mobileNumber": userModel.mobileNumber,
        "sender": auth.currentUser!.uid,
        "receiver": uids,
        "address": "At this ${userModel.city}, ${userModel.district}",
      });

      await firestore
          .collection('users')
          .doc(uids)
          .collection('requests')
          .doc(auth.currentUser!.phoneNumber)
          .set({
        "name": userModel.name,
        "bloodGroup": userModel.bloodGroup,
        "mobileNumber": userModel.mobileNumber,
        "sender": auth.currentUser!.uid,
        "receiver": uids,
        "address": "At this ${userModel.city}, ${userModel.district}",
      });
    });
  }

  List<Map<String, dynamic>> getRequests() {
    List<Map<String, dynamic>> list = [];
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('requests')
        .get()
        .then((value) {
      for (var doc in value.docs) {
        if (doc.id != auth.currentUser!.uid) {
          list.add(doc.data());
        }
      }
    });
    return list;
  }
}
