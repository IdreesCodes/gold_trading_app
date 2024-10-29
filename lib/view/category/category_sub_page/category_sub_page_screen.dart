import 'package:fine_gold_flutter/common/widgets/app_text_field.dart';
import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/view/category/category_sub_page/sub_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../homescreen/widgets/top_products_widget.dart';

class CategorySubPageScreen extends StatefulWidget {
  const CategorySubPageScreen({super.key});

  @override
  State<CategorySubPageScreen> createState() => _CategorySubPageScreenState();
}

class _CategorySubPageScreenState extends State<CategorySubPageScreen> {
  List<String> title = [
    'Gold',
    'Silver',
    'Platinum',
    'Palladium',

  ];
  List<String> images = [
    'assets/images/gold_bisc.png',
    'assets/images/silver_bisc.png',
    'assets/images/platinum_bsic.png',
    'assets/images/pladium_bisc.png',

  ];
  List<Color> color=[
    const Color(0xffD5BE9E),
    const Color(0xffE5E4E2),
    const Color(0xffB5B5B6),
    const Color(0xff727272),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        fineGoldAppBar: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      //   AppTextFormField(
      //     prefixIcon: const Icon(CupertinoIcons.search,size: 24,),
      //     hintText: "Search",
      //     backgroundColor: Colors.grey.shade100,
      //   ),
      // const SizedBox(
      //   height: 20,
      // ),
      Expanded(
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.90,
            mainAxisSpacing: 20.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return  SubPageWidget(image: images[index], color: color[index], title: title[index],);
          },
        ),
      ),
    

          ],
        ),
      ),
    );
  }
}
