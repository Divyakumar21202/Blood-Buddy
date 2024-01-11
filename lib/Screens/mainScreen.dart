import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_odisha_blood/Screens/homeScreen.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/screens/donate_List_screen.dart';
import 'package:smart_odisha_blood/Screens/home_screen_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

Widget CurrentPage(int curr) {
  switch (curr) {
    case 0:
      return const HomeScreen();
    case 1:
      return const Center(child: Text('Donor List'));
    case 2:
      return const DonateListScreenX();
    default:
      return const Center(child: Text('Extra Screen'));
  }
}

class _MainScreenState extends State<MainScreen> {
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icons.library_books_sharp,
            text: 'Donor List',
          ),
          GButton(
            icon: Icons.search_sharp,
            text: 'Search',
          ),
          GButton(
            icon: Icons.history,
            text: 'History',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
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
          'Odisha Blood Camp',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
