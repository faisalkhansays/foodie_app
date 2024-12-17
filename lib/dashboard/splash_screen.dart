import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodie/dashboard/start_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const StartScreen()), // Replace with your main screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2BB673),
      body: Center(
        child: Text(
          'FOODSTER',
          style: TextStyle(
            fontSize: 48,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
