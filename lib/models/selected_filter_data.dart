import 'package:flutter_riverpod/flutter_riverpod.dart';

final SelectFilterDataProvider = StateProvider(
  (ref) => SelectFilterData(
    aPpositive: {'A+ve': false},
    bPositive: {'B+ve': false},
    abPositive: {'AB+ve':false},
    oPositive: {'O+ve':false},
    aNegative: {'A-ve':false},
    bNegative: {'A-ve':false},
    abNegative: {'AB-ve':false},
    oNegative: {'O-ve':false},
    country: '',
    state: '',
    city: '',
  ),
);

class SelectFilterData {
  Map<String, bool> aPpositive;
  Map<String, bool> bPositive;
  Map<String, bool> abPositive;
  Map<String, bool> oPositive;
  Map<String, bool> aNegative;
  Map<String, bool> bNegative;
  Map<String, bool> abNegative;
  Map<String, bool> oNegative;
  String country;
  String state;
  String city;
  SelectFilterData({
    required this.aPpositive,
    required this.bPositive,
    required this.abPositive,
    required this.oPositive,
    required this.aNegative,
    required this.bNegative,
    required this.abNegative,
    required this.oNegative,
    required this.country,
    required this.state,
    required this.city,
  });
}
