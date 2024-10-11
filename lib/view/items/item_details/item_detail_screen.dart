import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fine_gold_flutter/common/widgets/app_button.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/view/items/item_details/product_specs_widget.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_app_bar.dart';
import 'carousel_widget.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  List<String> imagesUrl=[
    'assets/images/gold.png',
    'assets/images/gold.png',
    'assets/images/gold.png',
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
appBar: CustomAppBar(
  title: "Details",
),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageCarousel(
                height: 280,
                autoPlay: true,
                imageUrls: imagesUrl,),
              const SizedBox(
                height: 15,
              ),
              Text(
                textAlign: TextAlign.start,
                '10 OZ SILVER ROYAL CANADIAN MINT BAR .999',style: AppConstants.headingBold
          
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(r'$120',style: AppConstants.primaryColorDescription.copyWith(
                      fontWeight: FontWeight.bold
                  ),),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffECFDF3)
                    ),
                    child: Center(child: Text('In Stock',style: AppConstants.description.copyWith(color: const Color(0xff027A48)),)),
          
                  ),
                ]
          
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Product Specifications',style: AppConstants.headingNormal,),
              const SizedBox(
                height: 15,
              ),
              const ProductSpecificationsWidget(keys: "Metal Type ", values: 'Silver',),
              const ProductSpecificationsWidget(keys: "Weight ", values: '10 Ounce',),
              const ProductSpecificationsWidget(keys: "Family ", values: 'Royal Canadian Mint',),
              const ProductSpecificationsWidget(keys: "Purity ", values: '0.999',),
              const SizedBox(
                height: 15,
              ),
              Text('Description',style: AppConstants.headingBold,),
              const SizedBox(
                height: 10,
              ),
              const Text('''Gold Stock offers 10 OZ SILVER ROYAL CANADIAN MINT BAR at competitive prices. Our bars are stamped with the Royal Canadian Mint logo and a distinct serial number. The 10 oz Silver Royal Canadian Mint Bar is engraved with the highest quality by the mint and is made of. 9999 silver. The weight and purity are printed immediately on each bar, and the classic insignia is surrounded by the name of the mint in both English and French.'''),

          const SizedBox(
            height: 10,
          ),
          CustomButton(onPress: (){
          
          },
          title: 'Call Now',
            bgColor: Colors.white,
            titleTextStyle: AppConstants.primaryColorDescription.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(onPress: (){

              },
                  title: 'Add to Cart',

              ),
            ],
          ),
        ),
      ),
    );
  }
}
