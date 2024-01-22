class TodayWeatherModel {
  final String date;
  final String hour;
  final double tempForThisHour;
  final String stateForThisHour;

  TodayWeatherModel({
    required this.date,
    required this.hour,
    required this.tempForThisHour,
    required this.stateForThisHour,
  });

  factory TodayWeatherModel.fromjson(json) {
    return TodayWeatherModel(
      date: json[0]['date'],
      hour: json[0]['hour'][0]['time'],
      tempForThisHour: json[0]['hour'][0]['temp_c'],
      stateForThisHour: json[0]['hour'][0]['condition']['text'],
    );
  }
}
