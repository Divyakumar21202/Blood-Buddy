import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_odisha_blood/Screens/homeScreen.dart';
import 'package:smart_odisha_blood/Screens/home_screen_drawer.dart';
import 'package:smart_odisha_blood/features/Blood-Request/screen/blood_request_screen.dart';
import 'package:smart_odisha_blood/features/Chat/scree.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});
  @override
  State<mainScreen> createState() => _MainScreenState();
}

Widget CurrentPage(int curr) {
  switch (curr) {
    case 0:
      return const HomeScreen();
    case 1:
      return const BloodRequestScreen();
    case 2:
      return const ChatScreen();
    default:
      return const Center(
        child: Text(
          'Oop\'s Page Not Found 😕',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      );
  }
}

class _MainScreenState extends State<mainScreen> {
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: RadialGradient(
          radius: 500,
          colors: [
            Colors.red,
            Colors.white,
            Colors.red[800]!,
          ],
        ),
      ),
      child: Scaffold(
        body: CurrentPage(curr),
        drawer: const HomeDrawer(),
        bottomNavigationBar: GNav(
          gap: 8,
          onTabChange: (index) {
            curr = index;
            setState(() {});
          },
          backgroundColor: Colors.redAccent,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.message_rounded,
              text: 'Requests',
              textSize: 12,
            ),
            GButton(
              icon: Icons.mark_chat_read,
              text: 'Chats',
            ),
          ],
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.pink],
              ),
            ),
          ),
          actions: const [
            Icon(
              Icons.loop_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
          ],
          title: Text(
            'Blood Buddy',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
