import 'package:flutter/material.dart';

class BloodGroupCard extends StatelessWidget {
  final String cardName;
  const BloodGroupCard({super.key, required this.cardName});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Center(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.white,
        child: Card(
          color: Colors.white24,
          elevation: 1,
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.2,
            child: Center(
              child: Text(
                cardName,
                style: TextStyle(
                  fontSize: size.height * 0.04,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
