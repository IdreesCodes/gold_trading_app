// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../utils/helper_functions.dart';

class DropdownValueCustom {

  final String value;
  final String id;
  DropdownValueCustom({required this.value, required this.id});
}

class CustomDropDown extends StatelessWidget {
  final Function(String) onPressed;
  CustomDropDown( {
    this.value,
    super.key,
    required this.items,
    required this.onPressed,

    this.title,
    this.info,
    this.titleTextStyle,
    this.noTitle,
  });
  var value;
  String? title;

  bool? noTitle= false;
  List<String> items;
  String? info;
  bool? isError=false;
  final TextStyle? titleTextStyle;
  @override
  Widget build(BuildContext context) {
    if(value==""){
      value=null;
    }
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(title??"",
                    style: titleTextStyle ??
                        AppConstants.description.copyWith(color: ColorConstants.primary,fontWeight: FontWeight.bold)),
              ),
            ),
            // info==null||info==''?const SizedBox():IconButton(onPressed: (){
            //   HelperFunctions.showModuleInfo(context, infoText: info.toString());
            // }, icon: Icon(Icons.info_outline_rounded,color: ColorConstants.primary,)),
          ],
        ),
        Center(
          child: StatefulBuilder(builder: (context, StateSetter setState) {
            return DropdownButtonFormField<int>(
              value: value.runtimeType.toString()=="String"?items.indexOf(value):value,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: ColorConstants.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: ColorConstants.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: ColorConstants.black,
                  ),
                ),
              ),
              validator: title!.endsWith("*") ? (value) {
                if (value == null || value.toString().isEmpty) {
                  return "Bitte gib einen Wert ein";
                }else{
                  return null;
                }
              }:null,
              hint:  const Text("Wählen",style: TextStyle(fontSize: 16, color: Colors.grey),),
              isExpanded: true,
              itemHeight: null,
              icon: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.expand_more,size: 24,),
              ),
              style: const TextStyle(fontSize: 18, color: Colors.black),
              onChanged: (newValue) {
                setState(() {
                  value=newValue;
                  onPressed(items[newValue!]);
                });
              },
              items: items.asMap().entries.map<DropdownMenuItem<int>>((entry) {
                int index = entry.key;
                String value = entry.value;
                return DropdownMenuItem<int>(
                  value: index,
                  child: Text(
                    value,
                    style: AppConstants.description,
                  ),
                );
              }).toList(),

            );
          }),
        ),
      ],
    );
  }
}