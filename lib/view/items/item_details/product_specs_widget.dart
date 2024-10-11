import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';

class ProductSpecificationsWidget extends StatefulWidget {
  final String? keys;
  final String? values;
  const ProductSpecificationsWidget({super.key, this.keys, this.values});

  @override
  State<ProductSpecificationsWidget> createState() => _ProductSpecificationsWidgetState();
}

class _ProductSpecificationsWidgetState extends State<ProductSpecificationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.keys??"",style: AppConstants.description,),
            Text(widget.values??"",style: AppConstants.description,),

          ],
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
        const SizedBox(
          height: 10,
        ),

      ],
    );
  }
}
