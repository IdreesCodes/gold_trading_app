// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../view/category/category_screen.dart';
import '../../view/homescreen/widgets/drop_down_widget.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({
    super.key,
     this.title='',
     this.backGroundColor,
     this.fineGoldAppBar,
    this.home = false,
    this.actionButton,
     this.bottom,
     this.height,
     this.leading,
  });
   String title;
  final bool home;
  Color? backGroundColor;
  bool? fineGoldAppBar;
  final double? height;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  List<Widget>? actionButton=[];

  @override
  Widget build(BuildContext context) {
    return fineGoldAppBar==true?      Padding(
      padding:
      const EdgeInsets.fromLTRB(14, 40, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/fine_gold_bullion_dark.png',
            height: 70,
            width: 110,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 35,

                  decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const DropDownWidget(whiteAppBar: true,),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategorySearchScreen()));
                  },
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ):AppBar(
      bottom: bottom,
      flexibleSpace:Container(
        decoration: const BoxDecoration(
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
  Size get preferredSize =>  Size(0,height??70 );

}
