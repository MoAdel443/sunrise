import 'package:flutter/material.dart';
import 'package:sunrise/components/forecast_item.dart';

class NextForecastBuilder extends StatelessWidget {
  const NextForecastBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ForecastItem();
      },
      itemCount: 3,
    );
  }
}
