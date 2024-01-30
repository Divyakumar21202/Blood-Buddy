import 'package:flutter_riverpod/flutter_riverpod.dart';

final bloodInfoModelProvider = StateProvider<BloodInfoModel>(
  (ref) => BloodInfoModel(
    ap: 0,
    abp: 0,
    bp: 0,
    an: 0,
    bn: 0,
    abn: 0,
    op: 0,
    on: 0,
  ),
);

class BloodInfoModel {
  int ap;
  int abp;
  int bp;
  int an;
  int bn;
  int abn;

  int op;
  int on;
  BloodInfoModel({
    required this.ap,
    required this.abp,
    required this.bp,
    required this.an,
    required this.bn,
    required this.abn,
    required this.op,
    required this.on,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ap': ap,
      'abp': abp,
      'bp': bp,
      'an': an,
      'bn': bn,
      'abn': abn,
      'op': op,
      'on': on,
    };
  }

  factory BloodInfoModel.fromMap(Map<String, dynamic> map) {
    return BloodInfoModel(
      ap: map['ap'] as int,
      abp: map['abp'] as int,
      bp: map['bp'] as int,
      an: map['an'] as int,
      bn: map['bn'] as int,
      abn: map['abn'] as int,
      op: map['op'] as int,
      on: map['on'] as int,
    );
  }
}
