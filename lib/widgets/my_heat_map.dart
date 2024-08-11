import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key, required this.startDate, required this.dataSets});
  final DateTime startDate;
  final Map<DateTime, int> dataSets;
  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      endDate: DateTime.now(),
      datasets: dataSets,
      colorMode: ColorMode.color,
      defaultColor: Colors.orange,
      textColor: Colors.white,
      showColorTip: false,
      showText: true,
      scrollable: true,
      size: 30,
      colorsets: {
        1: Colors.green.shade100,
        2: Colors.green.shade200,
        3: Colors.green.shade300,
        4: Colors.green.shade400,
        5: Colors.green.shade500,
        6: Colors.green.shade600,
        7: Colors.green.shade700,
        8: Colors.green.shade800,
      },
    );
  }
}
