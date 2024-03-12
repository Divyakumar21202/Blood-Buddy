import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/screens/donate_List_screen.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const donateListScreenX(),
          ),
        );
      },
      child: Container(
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
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Text(
                count,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
