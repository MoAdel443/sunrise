import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sunrise/components/splash_widget.dart';
import 'package:sunrise/models/weather_model.dart';
import 'package:sunrise/screens/home_screen.dart';
import 'package:sunrise/services/weather_services.dart';

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
                  // onSubmitted: (value) async {
                  //   WeatherModel weatherModel = await WeatherServices(Dio())
                  //       .getWeatherData(cityName: value);
                  //
                  //   log(weatherModel.todayWeatherModel.stateForThisHour);
                  // },
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
                  onPressed: () async {
                    WeatherModel weatherModel = await WeatherServices(Dio())
                        .getWeatherData(cityName: _locationController.text);

                    log(weatherModel.city);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen(
                            weatherModel: weatherModel,
                          );
                        },
                      ),
                    );
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
