import 'package:flutter/material.dart';
import 'package:sunrise/components/weather_item.dart';

class WeatherBuilder extends StatelessWidget {
  WeatherBuilder({
    super.key,
  });
  final List<bool> isSelected = [false, false, true, false];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return isSelected[index] ? Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            decoration: ShapeDecoration(
              color: const Color(0x332566A2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xff5096FF) )
              ),
            ),
            width: 70.0,
            child: const WeatherItem(),
          ),
        ) : const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: 70.0,
            child: WeatherItem(),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10.0,
      ),
      itemCount: 4,
    );
  }
}

