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
      height: 37,
      width: 175,
      decoration: BoxDecoration(
          color: ColorConstants.black,
          borderRadius: BorderRadius.circular(10)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name??"",style: AppConstants.headingBold.copyWith(
              fontSize: 16,
              color: Colors.white
          ),),
          Text(price??"",style: AppConstants.description.copyWith(
              fontSize: 16,
              color: const Color(0xffACACAC)
          ),),
          Text(fluctuation??"",style: AppConstants.description.copyWith(
              color: ColorConstants.green,
              fontSize: 16
          ),)
        ],
      ),
    );
  }
}
