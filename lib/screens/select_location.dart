import 'package:flutter/material.dart';
import 'package:sunrise/components/splash_widget.dart';
import 'package:sunrise/screens/home_screen.dart';

class SelectLocation extends StatelessWidget {
  SelectLocation({super.key});

  final String screenRoute = "SelectLocation";

  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SplashWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 270,
                height: 55,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: TextField(
                  controller: _locationController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                width: 80,
                height: 47,
                decoration: ShapeDecoration(
                  color: const Color(0xFF07244E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: TextButton(
                  child: const Text(
                    "Check",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: (){
                    //todo navigate to home screen
                    Navigator.of(context).pushReplacementNamed( HomeScreen().screenRoute);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
