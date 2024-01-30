import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DonorModel {
  final String DonorName;
  final String BloodGroup;
  final String City;
  final String District;
  final String mobileNumber;
  final bool isAvailable;
  DonorModel({
    required this.DonorName,
    required this.BloodGroup,
    required this.City,
    required this.District,
    required this.mobileNumber,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'DonorName': DonorName,
      'BloodGroup': BloodGroup,
      'City': City,
      'District': District,
      'mobileNumber': mobileNumber,
      'isAvailable': isAvailable,
    };
  }

  factory DonorModel.fromMap(Map<String, dynamic> map) {
    return DonorModel(
      DonorName: map['DonorName'] as String,
      BloodGroup: map['BloodGroup'] as String,
      City: map['City'] as String,
      District: map['District'] as String,
      mobileNumber: map['mobileNumber'] as String,
      isAvailable: map['isAvailable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DonorModel.fromJson(String source) =>
      DonorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
