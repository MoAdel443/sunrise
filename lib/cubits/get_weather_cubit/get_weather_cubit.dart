import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunrise/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:sunrise/models/weather_model.dart';
import 'package:sunrise/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(): super(WeatherInitState());

  late WeatherModel weatherModel ;

  getWeatherDataCubit ({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(Dio())
          .getWeatherData(cityName: cityName);
      emit(WeatherLoadedSuccessfulState());

    } catch (e) {
      emit(WeatherLoadedErrorState(e.toString()));
    }
  }
}