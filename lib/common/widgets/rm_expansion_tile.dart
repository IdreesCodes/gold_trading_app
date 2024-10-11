// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../utils/color_constants.dart';
//
// class MyCustomExpansionTile extends StatefulWidget {
//   final String title;
//   final String trailingTitle;
//   final List<Widget> children;
//   final Widget expandedContent;
//
//   MyCustomExpansionTile(
//       {required this.title,
//         this.trailingTitle = '',
//         required this.children,
//         required this.expandedContent});
//
//   @override
//   _MyCustomExpansionTileState createState() => _MyCustomExpansionTileState();
// }
//
// class _MyCustomExpansionTileState extends State<MyCustomExpansionTile> {
//   bool _isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       collapsedBackgroundColor:ColorConstants.rmCardBackground,
//       // collapsedShape:CircleBorder.,
//       backgroundColor: ColorConstants.rmCardBackground,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side:  BorderSide(color: ColorConstants.rmCardBackground),
//       ),
//       leading: Image.asset('assets/images/Group_16.png', height: 18, width: 18),
//       title: Text(
//         widget.title,
//         textAlign: TextAlign.left,
//         style: TextStyle(color: ColorConstants.rmPrimary,fontSize: 14),
//       ),
//       trailing: widget.trailingTitle.toString().isNotEmpty
//           ? Container(
//         padding: EdgeInsets.all(5.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: ColorConstants.rmPrimary),
//         ),
//         child: Text(
//           widget.trailingTitle,
//           style: TextStyle(color: ColorConstants.rmPrimary),
//         ),
//       )
//           : const SizedBox(),
//       children: _isExpanded
//           ? [
//         Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 5.0, vertical:
//           1.0),
//           child: widget.expandedContent,
//         ),
//       ]
//           : [],
//       onExpansionChanged: (bool expanded) {
//         setState(() {
//           _isExpanded = expanded;
//         });
//       },
//     );
//   }
// }