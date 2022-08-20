import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_model.dart';

class ChartWidget extends StatelessWidget {
  List<ChartModel> chartList;
  ChartWidget({required this.chartList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: SfCircularChart(
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: const TextStyle(fontSize: 17)),
        series: <CircularSeries>[
          DoughnutSeries<ChartModel, String>(
              dataSource: chartList,
              innerRadius: '85%',
              legendIconType: LegendIconType.circle,
              pointColorMapper: (ChartModel data, index) => data.color,
              xValueMapper: (ChartModel data, index) => data.title,
              yValueMapper: (ChartModel data, index) => data.amount),
        ],
      ),
    );
  }
}
