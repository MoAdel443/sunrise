import 'package:flutter/material.dart';
import 'package:sunrise/screens/home_screen.dart';
import 'package:sunrise/screens/select_location.dart';
import 'package:sunrise/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: const SplashScreen().screenRoute,
      routes: {
        const SplashScreen().screenRoute : (context) => const SplashScreen(),
        SelectLocation().screenRoute : (context) => const SplashScreen(),
      },
    );
  }
}
