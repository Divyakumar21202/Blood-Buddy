import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Constant-Widgets/cards/blood_group_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BloodGroupCard(
              cardName: 'A+',
            ),
            BloodGroupCard(
              cardName: 'B+',
            ),
            BloodGroupCard(
              cardName: 'A+',
            ),
            BloodGroupCard(
              cardName: 'B+',
            ),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BloodGroupCard(
              cardName: 'A+',
            ),
            BloodGroupCard(
              cardName: 'B+',
            ),
            BloodGroupCard(
              cardName: 'A+',
            ),
            BloodGroupCard(
              cardName: 'B+',
            ),
          ],
        ),

      ],
    ));
  }
}
