import 'package:riverpod/riverpod.dart';

final userModelProvider = StateProvider<UserModel?>((ref) => null);

class UserModel {
  final String name;
  final String bg;
  final String mobileNumber;
  final String gender;
  final String address;
  UserModel({
    required this.name,
    required this.bg,
    required this.mobileNumber,
    required this.gender,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'Bg': bg,
      'MobileNumber': mobileNumber,
      'Gender': gender,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      bg: map['Bg'] as String,
      mobileNumber: map['MobileNumber'] as String,
      gender: map['Gender'] as String,
      address: map['address'] as String,
    );
  }
}
