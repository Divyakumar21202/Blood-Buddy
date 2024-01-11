// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BloodFilterButton extends StatelessWidget {
  final String buttonName;
  const BloodFilterButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Text(
        buttonName,
        style:const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
