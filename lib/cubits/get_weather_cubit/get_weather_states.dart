class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherLoadedSuccessfulState extends WeatherState {}

class WeatherLoadedErrorState extends WeatherState {
  String error ;
  WeatherLoadedErrorState(this.error);
}

