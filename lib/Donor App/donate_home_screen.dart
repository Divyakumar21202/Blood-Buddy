import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_odisha_blood/Donor%20App/features/Request%20Lists/screens/requests_list_screen.dart';
import 'package:smart_odisha_blood/features/maps/location_searching_screen.dart';
import 'package:smart_odisha_blood/features/maps/maps_location_screen.dart';

class DonateHomeScreen extends StatefulWidget {
  const DonateHomeScreen({super.key});

  @override
  State<DonateHomeScreen> createState() => _DonateHomeScreenState();
}

List<Widget> screens = const [
  RequestListScreen(),
  LocationSearchingScreen(),
  MapSample(),
];

class _DonateHomeScreenState extends State<DonateHomeScreen> {
  int btmIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.pink,
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text('Donate Here'),
      ),
      bottomNavigationBar: GNav(
        onTabChange: (val) {
          btmIndex = val;
          setState(() {});
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search_sharp,
            text: 'Donor List',
          ),
          GButton(
            icon: Icons.search,
            text: 'Blood Caps\nNear By ME',
          ),
        ],
      ),
      body: screens[btmIndex],
    );
  }
}
