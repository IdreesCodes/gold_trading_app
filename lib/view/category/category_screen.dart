import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homescreen/widgets/top_products_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
        actionButton: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Icon(CupertinoIcons.search),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.78,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return TopProductsWidget(
                image: images[index],
                price: r'$120',
                desc: 'Gold 1 OZ Royal Canadian Mint Bar .9999',
              );
            },
          )),
    );
  }
}
