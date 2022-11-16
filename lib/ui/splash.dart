import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practical/ui/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 150,
          textColor: Colors.blue,
          style: FlutterLogoStyle.stacked,
        ),
      ),
    );
  }

  timer() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      },
    );
  }
}
