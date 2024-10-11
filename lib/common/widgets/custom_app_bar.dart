// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({
    Key? key,
     this.title='',
    this.home = false,
    this.actionButton,
     this.bottom,
     this.height,
     this.leading,
  }) : super(key: key);
   String title;
  final bool home;
  bool? rmAppBar;
  final double? height;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  List<Widget>? actionButton=[];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      flexibleSpace:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                ColorConstants.white,
                ColorConstants.white
              ]
          ),
        ),
      ),
      elevation: 0,
      title: Text(title, style: AppConstants.headingBold,),
      leading: leading ??(
          home ?
          InkWell(onTap: Scaffold.of(context).openDrawer, child: const Icon(Icons.menu, color: Colors.black,),):
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
      ),
      actions: actionButton,
      backgroundColor: ColorConstants.primary,
      centerTitle: true,
      titleTextStyle: AppConstants.headingNormal,
    );
  }

  @override
  Size get preferredSize =>  Size(0,height??56 );

}
