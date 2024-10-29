import 'package:fine_gold_flutter/managers/dio_client.dart';
import 'package:flutter/material.dart';

List<String> list = ['CAD  ', 'USD',];
class DropDownWidget extends StatefulWidget {
 final bool? whiteAppBar;
  const DropDownWidget({super.key , this.whiteAppBar});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: widget.whiteAppBar==true? const Color(0xffF2F2F2): const Color(0xff3a3a3a),
      value: dropdownValue,
      icon: Icon(Icons.expand_more_sharp,color: widget.whiteAppBar==true?const Color(0xff575757):Colors.white,size: 18,),
      elevation: 16,
      style:  TextStyle(color: widget.whiteAppBar==true?const Color(0xff575757):Colors.white),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {

        setState(() {
          DioClient.instance.setCurrency(value??"CAD");
          dropdownValue = value??"CAD";
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(" \$ $value"),
        );
      }).toList(),
    );
  }
}