import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class GridVIewWidget extends StatefulWidget {
  final String image;
  final String desc;
  final  String price;
  const GridVIewWidget({super.key, required this.image, required this.price,required this.desc});

  @override
  State<GridVIewWidget> createState() => _GridVIewWidgetState();
}

class _GridVIewWidgetState extends State<GridVIewWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(

        width:double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),

        ),
        child:  Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    width: double.infinity,

                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200),
                    child: Image.asset(widget.image,fit: BoxFit.contain,)),
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
                        fontSize: 14
                    ),),

                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}