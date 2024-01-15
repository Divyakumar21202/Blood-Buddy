class UserModel {
  final String name;
  final String uid;
  final String mobileNumber;
  final String district;
  final String village;
  final String password;
  final String address;
  UserModel({
    required this.name,
    required this.uid,
    required this.mobileNumber,
    required this.district,
    required this.village,
    required this.password,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'mobileNumber': mobileNumber,
      'district': district,
      'village': village,
      'password': password,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      mobileNumber: map['mobileNumber'] as String,
      district: map['district'] as String,
      village: map['village'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
    );
  }
}
