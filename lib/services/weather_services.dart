import 'package:dio/dio.dart';
import 'package:sunrise/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e66bba07a21d43b5a63150250242101';

  WeatherServices(this.dio);

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4");

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);

      return weatherModel;

    }
    on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          "oops! there was an error , try again later";
      throw (errMessage);
    }
    catch (e) {
      throw Exception("oops! there was an error , try again later");
    }
  }
}
