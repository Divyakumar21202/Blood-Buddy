import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Screens/landingScreen.dart';
import 'package:smart_odisha_blood/Screens/mainScreen.dart';
import 'package:smart_odisha_blood/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Blood Buddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          displayMedium: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const LandingScreen();
          }
          return const MainScreen();
        },
      ),
    );
  }
}
