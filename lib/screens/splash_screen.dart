import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sunrise/components/splash_widget.dart';
import 'package:sunrise/screens/select_location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  final String screenRoute = "Splashscreen";


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  _startDelay(){
    Timer(const Duration(seconds: 3), _goNext);
  }
  _goNext() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (c) {
        return SelectLocation();
      }),
    );
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SplashWidget(),
    );
  }
}


