import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Screens/home_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.redAccent,
        child: ListView(
          padding: EdgeInsets.all(0),
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.volunteer_activism_rounded),
              title: Text("Donate"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.admin_panel_settings_outlined),
              title: Text("Admin Panel"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
