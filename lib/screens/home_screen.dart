import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunrise/components/next_forecast.dart';
import 'package:sunrise/components/today_forecast.dart';
import 'package:sunrise/models/weather_model.dart';

import '../services/weather_services.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  final String screenRoute = "HomeScreen";




  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isToday = true;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(8, 36, 79, 1),
        toolbarHeight: 20.0,
        elevation: 0.0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(8, 36, 79, 1),
                Color.fromRGBO(19, 76, 181, 1),
                Color.fromRGBO(11, 66, 171, 1),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      //todo put here city name from previous screen
                      "Giza",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/Logo.png",
                  height: 200.0,
                ),
                const Text(
                  // todo put here degree
                  "  28º",
                  style: TextStyle(
                      fontSize: 54.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Precipitations",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Text(
                  "Max.: 31º Min.: 25º",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: double.infinity,
                    height: 47.0,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 16, 38, .3),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/rain.png"),
                            const Text(
                              "6%",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/tempruture.png"),
                            const Text(
                              "90%",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/wind.png"),
                            const Text(
                              "19 km/h",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                isToday ? const TodayForecast() : const NextForecast(),

                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: 142,
                    height: 47,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF07244E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (isToday) {
                          setState(() {
                            isToday = false;
                          });
                        } else {
                          setState(() {
                            isToday = true;
                          });
                        }
                      },
                      child: Text(
                        isToday ? 'Next Forecast' : "home",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ), //button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
