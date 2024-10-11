import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';

class TopProductsWidget extends StatefulWidget {
 final String image;
 final String desc;
 final  String price;
  const TopProductsWidget({super.key, required this.image, required this.price,required this.desc});

  @override
  State<TopProductsWidget> createState() => _TopProductsWidgetState();
}

class _TopProductsWidgetState extends State<TopProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 230,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),

      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200),
                child: Image.asset(widget.image,width: 80,height: 120,)),
            const SizedBox(
              height: 5,
            ),
            Text(widget.desc,style: AppConstants.description.copyWith(
                fontSize: 14
            ),),
            const SizedBox(
              height: 5,
            ),
            Text(widget.price,style: AppConstants.primaryColorDescription.copyWith(
                fontSize: 15
            ),),
          ],
        ),
      )
    );
  }
}
