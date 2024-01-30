class UserModel {
  final String name;
  final String uid;
  final String mobileNumber;
  final String district;
  final String city;
  final bool isAvailable;
  UserModel({
    required this.name,
    required this.uid,
    required this.mobileNumber,
    required this.district,
    required this.city,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'mobileNumber': mobileNumber,
      'district': district,
      'city': city,
      'isAvailable': isAvailable,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      mobileNumber: map['mobileNumber'] as String,
      district: map['district'] as String,
      city: map['city'] as String,
      isAvailable: map['isAvailable'] as bool,
    );
  }
}
