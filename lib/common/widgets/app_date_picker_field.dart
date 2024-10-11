// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';
import 'app_text_field.dart';

class AppDatePickerField extends StatelessWidget {
  AppDatePickerField({
    super.key,
    required this.onSelectDate,
    this.controller,
    this.title,

  });

  final Function(String) onSelectDate;
  final String? title;
  TextEditingController? controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDatePicker(
          context: context,
          locale: const Locale("de","DE"),
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2050),
        ).then((picked){
          if (picked != null ) {
            controller?.text="${picked.day}.${picked.month}.${picked.year}";
            onSelectDate(controller!.text);
          }
        });
      },
      child: AbsorbPointer(
        child: AppTextFormField(
          readOnly: true,
          title: title??"",
          controller: controller,
          suffixIcon: IconButton(icon: Icon(Icons.calendar_month_rounded,size: 24,color: ColorConstants.secondary), onPressed: () {},),
        ),
      ),
    );
  }
}