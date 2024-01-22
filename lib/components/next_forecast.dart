import 'package:flutter/material.dart';
import 'package:sunrise/components/next_forecast_builder.dart';

class NextForecast extends StatelessWidget {
  const NextForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: ShapeDecoration(
          color: const Color(0xFF000F26).withOpacity(.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 14.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Next Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Expanded(
                child: NextForecastBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
