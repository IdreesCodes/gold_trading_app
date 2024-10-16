import 'package:fine_gold_flutter/common/widgets/app_text_field.dart';
import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/view/category/selected_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../homescreen/widgets/top_products_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
          
            color: Colors.white,
            child:  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Filters',style: AppConstants.headingBold.copyWith(
                      fontSize: 22
                  ),),
                  const SizedBox(
                    height: 19,
                  ),
                  Text('Price Range',style: AppConstants.headingBold.copyWith(
                      fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),),
                  const SizedBox(
                    height: 19,
                  ),
                  SfRangeSlider(
                    activeColor: ColorConstants.primary,
                    min: 0.0,
                    max: 100.0,
                    values: _values,
                    interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values){
                      setState(() {
                        _values = values;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          hintText: "Min price",
                          border: Border.all(
                            color: Colors.black
                          ),
                          backgroundColor: Colors.grey.shade100,
                        ),
                      ),
          
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200
                        ),
                      ),
                      Expanded(
                        child: AppTextFormField(
                          hintText: "Max price",
                          border: Border.all(
                              color: Colors.black
                          ),
                          backgroundColor: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Text('Product Status',style: AppConstants.headingBold.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),),
                  StockStatusWidget(),
              const SizedBox(
                height: 19,
              ),
          
          
            Text('Category',style: AppConstants.headingBold.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),),
                  const SizedBox(
                    height: 10,
                  ),
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
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  SfRangeValues _values = SfRangeValues(40.0, 80.0);



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
          GestureDetector(
            onTap: _showBottomSheet,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset('assets/images/filter.png',height: 22,width: 22,),
            ),
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
