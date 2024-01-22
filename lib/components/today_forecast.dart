import 'package:flutter/material.dart';
import 'package:sunrise/components/weather_builder.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        height: 217,
        decoration: ShapeDecoration(
          color: const Color(0xFF000F26).withOpacity(.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 14.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    //todo put the history here
                    "Mar,9",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ), //history bar
              Expanded(
                child: Center(child: WeatherBuilder()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
