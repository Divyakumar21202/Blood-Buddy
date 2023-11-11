import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Screens/home_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:const TextTheme(
          titleLarge: TextStyle(color:Colors.black,fontSize: 24,fontWeight: FontWeight.w500),
          displayMedium: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
