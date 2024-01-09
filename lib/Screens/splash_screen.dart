import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("asset/images/Designer.png",fit: BoxFit.cover,),
      ),
    );
  }
}

