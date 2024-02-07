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
                    gradient: const LinearGradient(colors: [
                      Colors.red,
                      Colors.pink,
                    ]),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Image(
                    image: NetworkImage(
                      "https://img.freepik.com/free-vector/illustration-people-donating-blood_23-2148246357.jpg?w=1380&t=st=1707247076~exp=1707247676~hmac=ce0f39d57fa6792df9139541ce65c783861fcc439c0269a4c0827863f56e05e2",
                    ),
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
                    gradient: const LinearGradient(colors: [
                      Colors.red,
                      Colors.pink,
                    ]),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Image(
                    image: NetworkImage(
                      "https://img.freepik.com/premium-vector/flat-illustration-young-girl-donating-blood-world-blood-day-donation-concept_830469-683.jpg?w=1380",
                    ),
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
