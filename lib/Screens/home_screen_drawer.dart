import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_odisha_blood/Screens/landingScreen.dart';
import 'package:smart_odisha_blood/Screens/mainScreen.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/screens/donate_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.redAccent,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                'Welcome To\nSmart Odisha Blood Camp',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MainScreen(),
                  ),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DonateScreen()),
                  );
                },
                leading: const Icon(Icons.volunteer_activism_rounded),
                title: const Text("Donate")),
            ListTile(
                onTap: () {},
                leading: const Icon(Icons.admin_panel_settings_outlined),
                title: const Text("Admin Panel")),
            ListTile(
              onTap: () async {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                  (route) => false,
                );
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('uid');
                sharedPreferences.remove('password');
                sharedPreferences.remove('mobileNumber');
                await FirebaseAuth.instance.signOut();
              },
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
