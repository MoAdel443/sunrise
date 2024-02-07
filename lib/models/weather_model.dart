class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.forecast,this.current});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current = json['current'] != null
        ? Current.fromJson(json['current'])
        : null;
    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
  }
}

class Location {
  String? cityName;
  Location({this.cityName});
  Location.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
  }
}

class Current {
  int? isDay;
  int? windKph;
  int? humidity;

  Current({
    this.isDay,
    this.windKph,
    this.humidity,
  });

  Current.fromJson(Map<String, dynamic> json) {
    isDay = json['is_day'];
    windKph = json['wind_kph'];
    humidity = json['humidity'];
  }
}

class Condition {
  String? status;

  Condition({this.status});

  Condition.fromJson(Map<String, dynamic> json) {
    status = json['text'];
  }
}

class Forecast {
  List<ForecastDay>? forecastDay;

  Forecast({this.forecastDay});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastDay = <ForecastDay>[];
      json['forecastday'].forEach((day) {
        forecastDay!.add(ForecastDay.fromJson(day));
      });
    }
  }
}

class ForecastDay {
  Day? day;
  List<Hour>? hour;

  ForecastDay({this.day, this.hour});

  ForecastDay.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? Day.fromJson(json['day']) : null;

    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }
}

class Day {
  double? maxTemp;
  double? minTemp;
  double? avgTemp;
  int? rainChance;
  Condition? condition;

  Day({
    this.maxTemp,
    this.minTemp,
    this.avgTemp,
    this.rainChance,
    this.condition,
  });

  Day.fromJson(Map<String, dynamic> json) {
    maxTemp = json['maxtemp_c'];
    minTemp = json['mintemp_c'];
    avgTemp = json['avgtemp_c'];
    rainChance = json['daily_chance_of_rain'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
}

class Hour {
  String? time;
  double? tempC;
  Condition? conditionForHour;

  Hour({
    this.time,
    this.tempC,
    this.conditionForHour,
  });

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    conditionForHour = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
}
