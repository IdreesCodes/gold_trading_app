import 'package:fine_gold_flutter/common/providers/providers.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockStatusWidget extends StatefulWidget {
  const StockStatusWidget({super.key});

  @override
  _StockStatusWidgetState createState() => _StockStatusWidgetState();
}

class _StockStatusWidgetState extends State<StockStatusWidget> {



  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        var provider = ref.watch(productProvider);
        return Column(
          children: [

            GestureDetector(
              onTap: () => provider.setFilterValue(stockStatus:"instock" ),
              child: StockOptionWidget(
                title: 'In Stock',
                isSelected: provider.filterStockStatus == 'instock',
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () => provider.setFilterValue(stockStatus:"outofstock" ),
              child: StockOptionWidget(
                title: 'Out of Stock',
                isSelected: provider.filterStockStatus == 'outofstock',
              ),
            ),
          ],
        );
      }
    );
  }
}

class StockOptionWidget extends StatelessWidget {
  final String title;
  final bool isSelected;

  const StockOptionWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.grey.shade100 : Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: isSelected,
            groupValue: true,
            onChanged: (bool? value) {},
            activeColor: ColorConstants.primary,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.black : Colors.black,
            ),
          ),

        ],
      ),
    );
  }
}