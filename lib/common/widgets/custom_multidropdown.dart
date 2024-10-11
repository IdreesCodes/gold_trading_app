// import 'package:flutter/material.dart';
//
// import '../../utils/app_constants.dart';
// import '../../utils/color_constants.dart';
// import '../../utils/helper_functions.dart';
//
// class CustomMultiDropdown<T extends Object> extends StatefulWidget {
//   const CustomMultiDropdown({
//     super.key,
//     required this.title,
//     required this.optionObjectList,
//     // required this.selectedOptionObjectList,
//     required this.onSelectionChange,
//     required this.labelList,
//     this.info
//   });
//
//   final List<T> optionObjectList;
//   // final List<T> selectedOptionObjectList;
//   final List<String> labelList;
//   final Function(List<T>) onSelectionChange;
//   final String title;
//   final String? info;
//
//
//   @override
//   State<CustomMultiDropdown> createState() => _CustomMultiDropdownState<T>();
// }
//
// class _CustomMultiDropdownState<T extends Object> extends State<CustomMultiDropdown<T>> {
//   final controller = MultiSelectController<T>();
//   List<DropdownItem<T>> dropdownItems = [];
//   Type myType = String;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     dropdownItems = List<DropdownItem<T>>.generate(10,
//           (index) => DropdownItem<T>(
//         label: widget.labelList[index],
//         value: widget.optionObjectList[index],
//       ),
//     );
//     controller.setItems(dropdownItems);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (widget.title.isNotEmpty)
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Text(widget.title,
//                       style: AppConstants.heading2.copyWith(
//                               color: ColorConstants.primary,
//                               fontWeight: FontWeight.bold)),
//                 ),
//               ),
//               widget.info == null || widget.info == ''
//                   ? const SizedBox()
//                   : IconButton(
//                   onPressed: () {
//                     HelperFunctions.showModuleInfo(context,
//                         infoText: widget.info.toString());
//                   },
//                   icon: Icon(
//                     Icons.info_outline_rounded,
//                     color: ColorConstants.primary,
//                   )),
//             ],
//           ),
//         MultiDropdown<T>(
//           items: dropdownItems,
//           controller: controller,
//           enabled: true,
//           searchEnabled: true,
//           chipDecoration:  ChipDecoration(
//               backgroundColor: ColorConstants.primary,
//               wrap: true,
//               runSpacing: 4,
//               spacing: 15,
//               deleteIcon: Icon(Icons.clear, color: Colors.white, size: 15.sp),
//               labelStyle: const TextStyle(color: Colors.white)
//           ),
//           fieldDecoration: FieldDecoration(
//             hintText: widget.title.replaceAll("*", ''),
//             hintStyle: const TextStyle(color: Colors.black38),
//             showClearIcon: false,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.black),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.black),
//             ),
//           ),
//           dropdownDecoration:  DropdownDecoration(
//             marginTop: 2,
//             maxHeight: 500,
//             header: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Text(
//                 '${widget.title} aus der Liste auswählen',
//                 textAlign: TextAlign.start,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           dropdownItemDecoration: DropdownItemDecoration(
//             selectedIcon: Icon(Icons.check_box, color: ColorConstants.primary),
//             disabledIcon: const Icon(Icons.lock, color: Colors.red),
//           ),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return '${widget.title} aus der Liste auswählen';
//             }
//             return null;
//           },
//           onSelectionChange: (selectedItems) {
//             widget.onSelectionChange(selectedItems);
//           },
//         ),
//       ],
//     );
//   }
// }
