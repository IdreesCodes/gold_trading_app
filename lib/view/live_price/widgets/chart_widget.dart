import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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



class LineChartWidget extends StatelessWidget {
  final List<double> data;

  const LineChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.shade200,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const titles = ['April', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct'];
                    final index = value.toInt();
                    if (index >= 0 && index < titles.length) {
                      return Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey.shade600,
                        ),
                      );
                    }
                    return const Text('');
                  },
                ),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 14,
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 3,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toStringAsFixed(0),
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
                spots: data.asMap().entries.map((e) {
                  return FlSpot(e.key.toDouble(), e.value);
                }).toList(),
                isCurved: false,
                color: ColorConstants.primary,
                barWidth: 2.6,
                belowBarData: BarAreaData(
                    show: true,
                    color: ColorConstants.primary.withOpacity(0.15)
                ),
                dotData: const FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
