class UserModel {
  final String name;
  final String uid;
  final String mobileNumber;
  final String district;
  final String city;
  final bool isAvailable;
  final String password;
  final String bloodGroup;
  final String latitude;
  final String longitude;

  UserModel({
    required this.name,
    required this.uid,
    required this.mobileNumber,
    required this.district,
    required this.city,
    required this.isAvailable,
    required this.password,
    required this.bloodGroup,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'mobileNumber': mobileNumber,
      'district': district,
      'city': city,
      'isAvailable': isAvailable,
      'password': password,
      'bloodGroup': bloodGroup,
      'latitude': latitude,
      'longitude': longitude,
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
      password: map['password'] as String,
      bloodGroup: map['bloodGroup'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }
}
