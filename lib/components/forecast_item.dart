import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Monday',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        Image.asset(
          "assets/images/weatherStates/rain.png",
          width: 70.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            const Text(
              '13°C',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(width: 6.0,),
            Text(
              '10°C',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(.7),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),

          ],
        ),
      ],
    );
  }
}