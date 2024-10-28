import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatefulWidget {
  final String spotBuy;
  final String spotSell;
  final String ounceBuy;
  final String ounceSell;
  final String kiloBuy;
  final String kiloSell;
  const DataTableWidget({super.key, required this.spotBuy, required this.spotSell, required this.ounceBuy, required this.ounceSell, required this.kiloBuy, required this.kiloSell});

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
        headingRowColor: WidgetStateProperty.all(ColorConstants.secondary),
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
        rows:  [
          DataRow(cells: [
             DataCell(Text('Spot',style: TextStyle(
              color: Color(0xff686868)
            ),)),
            DataCell(Text("\$${double.tryParse(widget.spotBuy)?.toStringAsFixed(2) ?? '0.000'}",
              style: const TextStyle(
                  color: Color(0xff686868)
              ),
            )),
            DataCell(Text("\$${double.tryParse(widget.spotSell)?.toStringAsFixed(2) ?? '0.000'}",
              style: const TextStyle(
                  color: Color(0xff686868)
              ),
            )),
          ]),
          DataRow(cells: [
            const DataCell(Text('Ounce',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text("\$${double.tryParse(widget.ounceBuy)?.toStringAsFixed(2) ?? '0.000'}",
              style: const TextStyle(
                  color: Color(0xff686868)
              ),
            )),
            DataCell(Text("\$${double.tryParse(widget.ounceSell)?.toStringAsFixed(2) ?? '0.000'}",
              style: const TextStyle(
                  color: Color(0xff686868)
              ),
            )),
          ]),
          DataRow(cells: [
            const DataCell(Text('Kilo',style: TextStyle(
                color: Color(0xff686868)
            ),)),
            DataCell(Text("\$${double.tryParse(widget.kiloBuy)?.toStringAsFixed(1) ?? '0.000'}",
              style: const TextStyle(
                  color: Color(0xff686868)
              ),
            )),
            DataCell(Text("\$${double.tryParse(widget.kiloSell)?.toStringAsFixed(1) ?? '0.000'}",
              style: const TextStyle(
                  color: Color(0xff686868)
              ),
            )),
          ]),
        ],
      ),
    );
  }
}
