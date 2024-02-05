import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Donor%20App/donate_home_screen.dart';

class SplitAppScreen extends StatelessWidget {
  const SplitAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool val) {
        const AlertDialog(
          title: Text('Are U sure to Exit ?'),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Need Blood',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 29),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DonateHomeScreen(),
                      ),
                    );
                  },
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Donate Blood',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
