import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodFilterButton extends ConsumerWidget {
  final bool isSelected;
  final String buttonName;
  final VoidCallback onTap;
  const BloodFilterButton({
    Key? key,
    required this.buttonName,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: 6,
          bottom: 6,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : null,
          border: Border.all(
            color: Colors.red,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
