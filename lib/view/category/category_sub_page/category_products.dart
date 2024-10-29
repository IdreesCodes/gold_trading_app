import 'package:fine_gold_flutter/common/widgets/app_text_field.dart';
import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/view/category/category_sub_page/sub_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/providers/providers.dart';
import '../../../utils/color_constants.dart';
import '../../homescreen/widgets/new_arival_widget.dart';
import '../../homescreen/widgets/top_products_widget.dart';
import '../../items/item_details/item_detail_screen.dart';

class CategoryProducts extends StatefulWidget {
  CategoryProducts({super.key,required this.selectedIndex});
  int selectedIndex = 0;
  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        fineGoldAppBar: true,
      ),
      body:Consumer(
          builder: (context,ref,_) {
            var provider= ref.watch(productProvider);
            var products = provider.productModel?.products;
            return provider.productModel==null?
            const CircularProgressIndicator.adaptive():
            ListView.builder(
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  return  products![index].title!.contains(widget.selectedIndex==0?"GOLD":widget.selectedIndex==1?"SILVER":widget.selectedIndex==2?"PLATINUM":"PALLADIUM")? GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetailScreen(products: products[index],)));
                    },
                    child: NewArrivalWidget(
                      image: products[index].imageUrl??'',
                      desc: products[index].title??'',
                      title: '',//products?[index].title??'',
                      price: products[index].price??"",
                    ),
                  ):const SizedBox();
                }
            );
          }
      )
    );
  }
}
