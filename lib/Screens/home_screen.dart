import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Donate_List_item/donate_item_view.dart';
import 'package:smart_odisha_blood/Screens/donate_list.dart';
import 'package:smart_odisha_blood/Screens/home_screen_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget CurrentPage(int curr) {
  switch (curr) {
    case 0:
      return Home();
      break;
    case 1:
      return const DonateListScreen();
      break;
    case 2:
      return const Center(child: Text('Search Page'));
      break;
    default:
      return const Center(child: Text('Donate Page'));
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
            icon: Icons.add_circle_outline_sharp,
            text: 'Donate',
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

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}
