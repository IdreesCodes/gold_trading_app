import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/color_constants.dart';

class CategoriesWidget extends StatelessWidget {
  final String name;
 final  String image;
 final Color color;
  const CategoriesWidget({super.key, required this.name, required this.image,required this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 130,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,height: 80,),
          const SizedBox(
            height: 5,
          ),
          Text(name,style: AppConstants.description.copyWith(
              fontSize: 14
          ),),
        ],
      ),
    );

  }
}
