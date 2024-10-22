import 'package:fine_gold_flutter/utils/app_constants.dart';
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
          borderRadius: BorderRadius.circular(5)

        ),
        clipBehavior: Clip.hardEdge,
        headingRowColor: MaterialStateProperty.all(ColorConstants.secondary),
        columns:  [
          DataColumn(label: Text('Quantity', style: AppConstants.headingNormal.copyWith(
            fontSize: 16
          ),)),
          DataColumn(label: Text('Buy',style: AppConstants.headingNormal.copyWith(
          fontSize: 16
          ),)),
          DataColumn(label: Text('Sell',style: AppConstants.headingNormal.copyWith(
              fontSize: 16
          ),)),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('Spot',style: TextStyle(
              color: Color(0xff686868)
            ),)),
            DataCell(Text(r'$1400',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text(r'$1500',style: TextStyle(
                color: Color(0xff686868)
            ),)),
          ]),
          DataRow(cells: [
            DataCell(Text('Ounce',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text(r'$1400',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text(r'$1500',style: TextStyle(
                color: Color(0xff686868)
            ),)),
          ]),
          DataRow(cells: [
            DataCell(Text('Kilo',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text(r'$400',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text(r'$1500',style: TextStyle(
                color: Color(0xff686868)
            ),)),
          ]),
        ],
      ),
    );
  }
}
