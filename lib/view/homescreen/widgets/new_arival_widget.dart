import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:flutter/material.dart';
class NewArrivalWidget extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final  String price;
  const NewArrivalWidget({super.key, required this.image, required this.price,required this.desc, required this.title});

  @override
  State<NewArrivalWidget> createState() => _NewArrivalWidgetState();
}

class _NewArrivalWidgetState extends State<NewArrivalWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Container(

      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(7)
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: screenHeight *0.12,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // padding:  const EdgeInsets.all(3.0),
                        height: 80,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200),
                        child: Image.network( widget.image,fit:BoxFit.cover ,)),

                  ],
                ),
              )
          ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(top: 0.0,left: 2),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(widget.title,style: AppConstants.headingBold,),
                  //
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    maxLines: 2,
                   widget.desc,style: AppConstants.description.copyWith(
                      fontSize: 15
                  ),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(widget.price,style: AppConstants.primaryColorDescription.copyWith(
                      fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),),
             
                ],
                         ),
             ),
           )
        ],
      ),
    );
  }
}
