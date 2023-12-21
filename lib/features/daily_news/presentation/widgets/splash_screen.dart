import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
            () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const DailyNews())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
              child: Lottie.asset(
                'assets/animation/splash_animation.json', // Replace with the path to your Lottie JSON file
                fit: BoxFit.cover,
                width: 200, // Adjust the width and height as needed
                height: 200,
                repeat: true, // Set to true if you want the animation to loop
              ),
            ),
            );
  }
}