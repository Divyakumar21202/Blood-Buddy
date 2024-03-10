import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_odisha_blood/Donor%20App/donate_home_screen.dart';
import 'package:smart_odisha_blood/Screens/mainScreen.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';

class SplitAppScreen extends ConsumerStatefulWidget {
  const SplitAppScreen({super.key});

  @override
  ConsumerState<SplitAppScreen> createState() => _SplitAppScreenState();
}

class _SplitAppScreenState extends ConsumerState<SplitAppScreen> {
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    // Request location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Handle the case where the user denies permission forever
        print(
            'Location permission denied forever. Please enable it in app settings.');
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // Do something with the position
      ref.read(authRepositoryControllerProvider).uploadUserlocation(
            context: context,
            latitude: position.latitude.toString(),
            longitude: position.longitude.toString(),
          );
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      // Handle any errors that occur while getting the location
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool val) async {},
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
                ),
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
                    image: AssetImage('asset/images/donate.jpg'),
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
                  bottom: -3,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
