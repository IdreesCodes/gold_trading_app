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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(

      width: screenWidth*0.4,
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
            Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200),
                  child: Image.asset(widget.image,)),
            ),
            const SizedBox(
              height: 5,
            ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                widget.desc,style: AppConstants.description.copyWith(
                  fontSize: 14
              ),),
              const SizedBox(
                height: 5,
              ),
              Text(widget.price,style: AppConstants.primaryColorDescription.copyWith(
                  fontSize: 15
              ),),
            ],
          ))
          ],
        ),
      )
    );
  }
}
