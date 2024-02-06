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
        backgroundColor: Colors.red,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/happy-world-blood-donor-day-red-white-black-background-social-media-design-banner-free-vector_1340-21622.jpg?w=826&t=st=1707243132~exp=1707243732~hmac=b859ddd87a65f1c3e2a8ef6dd26e5c54f0f151351a9f6039db81fabb6219b2f3'))),
                ),
                Positioned(
                  bottom: 90,
                  left: 140,
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
                          'Need Blood',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/happy-world-blood-donor-day-red-white-black-background-social-media-design-banner-free-vector_1340-21622.jpg?w=826&t=st=1707243132~exp=1707243732~hmac=b859ddd87a65f1c3e2a8ef6dd26e5c54f0f151351a9f6039db81fabb6219b2f3'))),
                ),
                Positioned(
                  bottom: 90,
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
