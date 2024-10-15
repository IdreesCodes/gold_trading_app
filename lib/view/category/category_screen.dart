import 'package:fine_gold_flutter/common/widgets/app_text_field.dart';
import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../homescreen/widgets/top_products_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  List<String> titleList=[
    'All',
    'Gold bars',
    'Gold Coins',

  ];
  List<String> images = [

    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,
    "assets/images/gold.png"  ,

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Search',
        actionButton:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Icon(CupertinoIcons.search),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset('assets/images/filter.png',height: 22,width: 22,),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(

                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 40,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:  selectedIndex == index ?ColorConstants.primary: Colors.grey.shade100,
                      ),
                      child: Center(
                        child: Text(
                          titleList[index],
                          style: selectedIndex == index? AppConstants.descriptionWhite: AppConstants.description,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              AbsorbPointer(
                child: AppTextFormField(
                  suffixIcon: const Icon(Icons.expand_more,size: 24,),
                  hintText: "Sub Categories",
                  backgroundColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return TopProductsWidget(
                      image: images[index],
                      price: r'$120',
                      desc: 'Gold 1 OZ Royal Canadian Mint Bar .9999',
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
