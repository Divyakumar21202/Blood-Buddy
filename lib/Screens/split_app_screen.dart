import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Donor%20App/donate_home_screen.dart';
import 'package:smart_odisha_blood/Screens/mainScreen.dart';

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
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: MediaQuery.of(context).size.height / 2 - 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.pink,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Image(
                    image: AssetImage('asset/images/need.jpg'),
                  ),
                ),
                const Positioned(
                  top: 14,
                  left: 80,
                  child: Text(
                    'You Need A Blood ?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  left: 134,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Request Blood',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: MediaQuery.of(context).size.height / 2 - 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.pink,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Image(
                    image: AssetImage('asset/images/need.jpg'),
                  ),
                ),
                const Positioned(
                  top: 14,
                  left: 75,
                  child: Text(
                    'You Want to Donate ?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  left: 134,
                  child: GestureDetector(
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
