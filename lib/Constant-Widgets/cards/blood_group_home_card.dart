// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BloodGroupHomeCard extends StatelessWidget {
  final String bloodType;
  final String count;
  const BloodGroupHomeCard({
    Key? key,
    required this.bloodType,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9, left: 13, right: 13),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Colors.red[500]!,
            Colors.pink,
          ],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              bloodType,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            Text(
              count,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
