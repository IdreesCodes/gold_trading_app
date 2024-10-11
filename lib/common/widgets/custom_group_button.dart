// import 'package:flutter/material.dart';
// import '../../utils/app_constants.dart';
// import '../../utils/color_constants.dart';
//
// class CustomGroupButton extends StatelessWidget {
//   CustomGroupButton({super.key,this.title,this.btnColor,this.titleTextStyle,  this.trailingWidgets,this.actionWidgets});
//
//   Widget? trailingWidgets;
//
//   Widget? actionWidgets;
//
//
//   String?title;
//   final Color?btnColor;
//   final TextStyle?titleTextStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       decoration: BoxDecoration(color: btnColor??ColorConstants.rmPrimary,
//           borderRadius: BorderRadius.circular(22)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//
//             Expanded(flex:3, child: Center(child: Text(title??'', style: titleTextStyle ?? AppConstants.description.copyWith(color: ColorConstants.white,fontWeight: FontWeight.bold,fontSize: 18),))),
//              Expanded(flex:1,child: trailingWidgets??const SizedBox()),
//
//           ],
//
//         ),
//       ),);
//   }
// }
