
import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';


class DrawerItem {
  String title;
  String screen;
  DrawerItem({required this.title, required this.screen});
}

class CustomExpansionTile extends StatefulWidget {
  final Widget? leading;
  final String title;
  final bool subChild;
  final String trailingText;
  // final Color trailingDecorationColor;


  final List<dynamic> drawerItems;


  const CustomExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.subChild = false,
    this.trailingText='',
    required this.drawerItems,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _isExpanded ? 8.0 : 0),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isExpanded ? ColorConstants.primary : null,
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent),
          ),
          onExpansionChanged: (isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
          leading:widget.leading,
          title: Text(
            widget.title,
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: _isExpanded ? 15 : 14,
              fontWeight: _isExpanded ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
          trailing: widget.trailingText.toString().isNotEmpty?Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
                  border: Border.all(),

            ),
          ): widget.subChild ? Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ColorConstants.white,
                ) : const SizedBox.shrink(),
          children: widget.drawerItems
              .map(
                  (item) {
                    return
                      "${item.runtimeType}"=="DrawerItem"?
                          // Container(width:200,height: 10,color: Colors.red,)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListTile(
                        title: Text(
                          item.title, style: TextStyle(color: ColorConstants.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //   context, MaterialPageRoute(builder: (context) => RmHome(route: item.screen)),
                          // );
                        },
                      ),
                      ) : Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: item as Widget
                      );
              }
          )
              .toList(),
        ),
      ),
    );
  }
}
