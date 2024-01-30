import 'dart:async';

import 'package:e_commerce_app/ui/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.blue.shade800, BlendMode.color),
          child: Image.asset('assets/phone_image.jpeg',
          height: 60,
          width: 60,
          ),
        ),
      ),
    );
  }
}
