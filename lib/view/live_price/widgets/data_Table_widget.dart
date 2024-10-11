import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({super.key});

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: double.infinity,

      child: DataTable(
        border: TableBorder.all(
          width: 1.0,
          color:ColorConstants.primary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)

        ),
        clipBehavior: Clip.hardEdge,
        headingRowColor: MaterialStateProperty.all(ColorConstants.secondary),
        columns: const [
          DataColumn(label: Text('Quantity')),
          DataColumn(label: Text('Buy')),
          DataColumn(label: Text('Sell')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('Spot')),
            DataCell(Text('1400')),
            DataCell(Text('1500')),
          ]),
          DataRow(cells: [
            DataCell(Text('Ounce')),
            DataCell(Text('1400')),
            DataCell(Text('1500')),
          ]),
          DataRow(cells: [
            DataCell(Text('Kilo')),
            DataCell(Text('400')),
            DataCell(Text('1500')),
          ]),
        ],
      ),
    );
  }
}
