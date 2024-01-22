import 'package:sunrise/models/today_weather_model.dart';

class WeatherModel {
  final String city;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final int rainChance;
  final int humidity;
  final double wind;
  final TodayWeatherModel todayWeatherModel;

  WeatherModel(
      {required this.todayWeatherModel,
      required this.city,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.rainChance,
      required this.humidity,
      required this.wind});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        todayWeatherModel: TodayWeatherModel.fromjson(json['forecast']['forecastday']),
        city: json["location"]["name"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        rainChance: json["forecast"]["forecastday"][0]["day"]
            ["daily_chance_of_rain"],
        humidity: json["forecast"]["forecastday"][0]["day"]["avghumidity"],
        wind: json["forecast"]["forecastday"][0]["day"]["avgvis_km"]);
  }
}




// api link ===>    #