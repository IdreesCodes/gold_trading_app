import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';

class SettingsWidget extends StatelessWidget {
 final String? title;
 const  SettingsWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 15,left: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
          color: Colors.grey.shade100),
      child: Text(title??"", style: AppConstants.description,),
    );
  }
}
