import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/color_constants.dart';

class PricesWidget extends StatelessWidget {
  final String? name;
  final String? price;
  final String? fluctuation;
   const PricesWidget({super.key,this.name,this.price,this.fluctuation});

  @override
  Widget build(BuildContext context) {
    return       Container(
      padding:const EdgeInsets.symmetric(horizontal: 10),


      decoration: BoxDecoration(
          color: ColorConstants.black,
          borderRadius: BorderRadius.circular(10)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(name??"",style: AppConstants.headingBold.copyWith(
                fontSize: 16,
                color: Colors.white
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price??"",style: AppConstants.description.copyWith(
                fontSize: 16,
                color: const Color(0xffACACAC)
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:  0.0),
            child: Text(fluctuation??"",style: AppConstants.description.copyWith(
                color: ColorConstants.green,
                fontSize: 16
            ),),
          )
        ],
      ),
    );
  }
}
