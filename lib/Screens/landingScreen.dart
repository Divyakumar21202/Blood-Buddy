import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_odisha_blood/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 9,
            ),
            const Text(
              'Welcome Life Saver',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2021/04/23/09/41/blood-6201268_640.png',
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Card(
                elevation: 1,
                child: SizedBox(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      child: Text(
                        'Agree & Continue',
                        style: TextStyle(
                          fontSize: 29,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 9,
            ),
          ],
        ),
      ),
    );
  }
}
