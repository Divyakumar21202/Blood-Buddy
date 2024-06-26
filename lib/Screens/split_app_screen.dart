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

  Future<void> _openAppSettings() async {
    // const uri = 'app-settings:';
    // Uri url = Uri.parse(uri);
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    // }
    await _openAppSettings();
  }

  void _getLocation() async {
    // Request location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
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
    } catch (e) {
      AlertDialog(
        title:const Text('Location Permission Required'),
        content:const Text('Please enable location permissions in app settings.'),
        actions: <Widget>[
          TextButton(
            child:const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child:const Text('Open Settings'),
            onPressed: () {
              _openAppSettings(); // Open app settings when button is pressed
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool val) async {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Blood Buddy'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://t3.ftcdn.net/jpg/04/87/84/26/240_F_487842611_55ZVQQaUFupM4aR6M5pgvq2ODV1nNB8a.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red[600],
                    ),
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(29, 16, 86, 1),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const mainScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'REQUEST BLOOD',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://t3.ftcdn.net/jpg/04/87/84/26/240_F_487842611_55ZVQQaUFupM4aR6M5pgvq2ODV1nNB8a.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(29, 16, 86, 1),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const DonateHomeScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'DONATE BLOOD',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 14,
                    left: 100,
                    child: Text(
                      'Want to Donate ?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
