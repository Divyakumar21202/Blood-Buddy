class DonorModel {
  final String DonorName;
  final String BloodGroup;
  final String City;
  final String District;
  DonorModel({
    required this.DonorName,
    required this.BloodGroup,
    required this.City,
    required this.District,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'DonorName': DonorName,
      'BloodGroup': BloodGroup,
      'City': City,
      'District': District,
    };
  }

  factory DonorModel.fromMap(Map<String, dynamic> map) {
    return DonorModel(
      DonorName: map['DonorName'] as String,
      BloodGroup: map['BloodGroup'] as String,
      City: map['City'] as String,
      District: map['District'] as String,
    );
  }
}
