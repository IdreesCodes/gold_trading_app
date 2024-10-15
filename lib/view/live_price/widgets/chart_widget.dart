import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  var data = [1.0, 4.0,2.0, 4.0, 5.0, 8.0, 9.0,];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170.0,
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
        xLabels: const ['April', 'May', 'Jun', 'July', 'Aug','Sep','Oct' ],
        xLabelsStyle: const TextStyle(
          fontSize: 8,
          color: Colors.black54
        ),

      ),
    );
  }
}
