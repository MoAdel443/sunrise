import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunrise/components/next_forecast.dart';
import 'package:sunrise/components/today_forecast.dart';
import 'package:sunrise/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:sunrise/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:sunrise/models/weather_model.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final String screenRoute = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isToday = true;

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
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          WeatherModel data = BlocProvider.of<WeatherCubit>(context).weatherModel;
          if (state is WeatherLoadedSuccessfulState) {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
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
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          const SizedBox(
                            width: 7.0,
                          ),
                          Text(
                            //todo put here city name from previous screen
                            data.location!.cityName!,
                            style: const TextStyle(
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
                      Text(
                        // todo put here degree
                        "${data.forecast!.forecastDay![0].day!.avgTemp!.floor()}º",
                        style: const TextStyle(
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
                       Text(
                        "Max.: ${data.forecast!.forecastDay![0].day!.maxTemp!.floor()}º Min.: ${data.forecast!.forecastDay![0].day!.minTemp!.floor()}º",
                        style: const TextStyle(
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
                                   Text(
                                    "${data.forecast!.forecastDay![0].day!.rainChance}%",
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/tempruture.png"),
                                   Text(
                                    "${data.current!.humidity}%",
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/wind.png"),
                                   Text(
                                    "${data.current!.windKph} km/h",
                                    style: const TextStyle(
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
            );
          }
          else if (state is WeatherLoadedErrorState) {
            return const Text("ther was an error");
          }
          else {
            return const Text("IDK");
          }
        },
      ),
    );
  }
}
