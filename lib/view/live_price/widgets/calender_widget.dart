import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  String? selectedValue;
  final List<String> dropdownItems = ['7 Days', '30 Days',];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: DropdownButton<String>(

          hint: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:  Text('30 Days',style: AppConstants.description.copyWith(fontSize: 12),),
          ),
          value: selectedValue,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon:  Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54,size: 18,),
        ),
      ),
    );
  }
}
