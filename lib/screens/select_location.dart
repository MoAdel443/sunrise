import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunrise/components/splash_widget.dart';
import 'package:sunrise/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:sunrise/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:sunrise/models/weather_model.dart';
import 'package:sunrise/screens/home_screen.dart';

class SelectLocation extends StatelessWidget {
  SelectLocation({super.key});

  final String screenRoute = "SelectLocation";

  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SplashWidget(),
            Container(
              width: 250,
              height: 55,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: TextField(
                onSubmitted: (value) {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherDataCubit(cityName: value);
                },
                controller: _locationController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                  color: const Color(0xff08244F),
                  borderRadius: BorderRadius.circular(15.0)),
              child: ConditionalBuilder(

                  condition: state is WeatherLoadedSuccessfulState,
                  builder: (context) {
                    return TextButton(
                        onPressed: () {
                          WeatherModel weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Check",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0),
                        ),
                      );
                  },
                  fallback: (context) {
                    return const Center(child: CircularProgressIndicator());
                  },
              )
            ),
          ],
        );
      },
    ));
  }
}


