import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:high_school/homes/home_scientific.dart';
import 'package:lottie/lottie.dart';

import 'departement/choose_department.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _time;

  void start() {
    _time = Timer(
      Duration(seconds: 4),
      call,
    );
  }

  void call() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseDepartment(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Lottie.asset(
          'assets/images/Animation.json',
        ),
      ),
    );
  }
}
