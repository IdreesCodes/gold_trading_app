import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {

  var data = [0.0, 5.0, 0.0, 15.0];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.0,
      child: Sparkline(
        gridLineColor: Colors.grey.shade300,
        gridLineLabelPrecision: 1,
        gridLinesEnable: true,
        lineColor: ColorConstants.primary,
        fillColor: ColorConstants.primary.withOpacity(0.15),
        fillMode: FillMode.below,
        data: data,
        lineWidth: 2.6,
        gridLineAmount: 3,
        xLabels: const ['April', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct'],
        xLabelsStyle: const TextStyle(fontSize: 8, color: Colors.black54),
      ),
    );
  }
}

// class ChartWidget extends StatefulWidget {
//   const ChartWidget({super.key});
//
//   @override
//   State<ChartWidget> createState() => _ChartWidgetState();
// }
//
// class _ChartWidgetState extends State<ChartWidget> {
//   var data = [0.0,5.0,0.0,15.0];
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 200.0,
//       child: Sparkline(
//
//       gridLineColor: Colors.grey.shade300,
//         gridLineLabelPrecision: 1,
//         gridLinesEnable: true,
//         lineColor: ColorConstants.primary,
//         fillColor: ColorConstants.primary.withOpacity(0.15),
//         fillMode: FillMode.below,
//         data: data,
//         lineWidth: 2.6,
//         gridLineAmount: 3,
//         xLabels: const ['April', 'May', 'Jun', 'July', 'Aug','Sep','Oct' ],
//         xLabelsStyle: const TextStyle(
//           fontSize: 8,
//           color: Colors.black54
//         ),
//
//       ),
//     );
//   }
// }
//
//
//

class LineChartWidget extends StatefulWidget {
  final List<double> data;


  const LineChartWidget({super.key, required this.data});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  String formatNumber(double number) {
    if (number >= 1000 && number < 1000000) {
      return "${(number / 1000).toStringAsFixed(1)}k";
    } else if (number >= 1000000) {
      return "${(number / 1000000).toStringAsFixed(1)}M";
    } else {
      return number.toStringAsFixed(0);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
            LineChartData(
              minY: widget.data.reduce((a, b) => a < b ? a : b) - 10,
              maxY: widget.data.reduce((a, b) => a > b ? a : b) + 10,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 100,
                verticalInterval: 1,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.shade200,
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: const AxisTitles(
                  // sideTitles: SideTitles(
                  //   showTitles: true,
                  //   getTitlesWidget: (value, meta) {
                  //     final index = value.toInt();
                  //     return Text(
                  //       'Point $index',
                  //       style: TextStyle(fontSize: 8, color: Colors.grey.shade600),
                  //     );
                  //   },
                  // ),
                ),
                leftTitles: AxisTitles(
                  axisNameSize: 14,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 200,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        formatNumber(value),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade600,
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: widget.data.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value);
                  }).toList(),
                  isCurved: false,
                  color: ColorConstants.primary,
                  barWidth: 2.6,
                  belowBarData: BarAreaData(
                    show: true,
                    color: ColorConstants.primary.withOpacity(0.15),
                  ),
                  dotData: const FlDotData(show: false),
                ),
              ],
            )

        ),
      ),
    );
  }
}
