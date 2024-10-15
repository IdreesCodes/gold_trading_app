import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';

class SubPageWidget extends StatefulWidget {
 final String image;
 final Color color;
 final String title;
  const SubPageWidget({super.key,required this.image, required this.color, required this.title});

  @override
  State<SubPageWidget> createState() => _SubPageWidgetState();
}

class _SubPageWidgetState extends State<SubPageWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: widget.color
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Image.asset( widget.image,),
            ),
          ),

          Expanded(
            child: Text(widget.title,style: AppConstants.description.copyWith(
                fontSize: 20
            ),),
          )
        ],
      ),
    );
  }
}
