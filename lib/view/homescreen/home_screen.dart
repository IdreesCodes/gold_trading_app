import 'package:fine_gold_flutter/common/providers/providers.dart';
import 'package:fine_gold_flutter/common/widgets/app_button.dart';
import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:fine_gold_flutter/view/homescreen/widgets/categories_widget.dart';
import 'package:fine_gold_flutter/view/homescreen/widgets/new_arival_widget.dart';
import 'package:fine_gold_flutter/view/homescreen/widgets/prices_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/app_constants.dart';
import '../items/item_details/item_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<String> title = [
    'Gold',
    'Silver',
    'Platinum',
  ];

  List<String> images = [
    'assets/images/gold_bisc.png',
    'assets/images/silver_bisc.png',
    'assets/images/platinum_bsic.png',
  ];

  List<Color> color = [
    ColorConstants.gold,
    ColorConstants.silver,
    ColorConstants.platinum,
    ColorConstants.gold,
    ColorConstants.silver,
  ];

  List<String> topProductImage = [
    'assets/images/gold_bisc.png',
    'assets/images/silver_bisc.png',
    'assets/images/gold.png',
  ];
  List<String> topProductdescription = [
    'Gold 1 OZ Royal Canadian Mint Bar .9999',
    '10 OZ SILVER ROYAL CANADIAN MINT BAR',
    'Gold 1 OZ Royal Canadian Mint Bar .9999',
  ];
  int selectedIndex = 0;
  List<String> titleList = ['Gold', 'Silver', 'Platinum', 'Palladium'];
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        fineGoldAppBar: true,
        whiteLogo: true,
      ),
        backgroundColor: const Color(0xff2b2b2b),
        body: SingleChildScrollView(
          child: Column(
            children: [


              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const AbsorbPointer(child: AutoScrollingPrices()),
                      const SizedBox(height: 20,),

                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/royal_candidate.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, bottom: 15, top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'ROYAL CANADIAN MINT',
                                          style:
                                          AppConstants.headingBold.copyWith(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Most secure bullion coins in the world ',
                                          style: AppConstants.descriptionWhite
                                              .copyWith(
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: CustomButton(
                                              bgColor: Colors.white,
                                              titleTextStyle: TextStyle(
                                                  color: ColorConstants.primary,
                                                  fontWeight: FontWeight.w500),
                                              width: 200,
                                              onPress: () {},
                                              title: 'Request Free Guide',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(flex: 1, child: SizedBox())
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Categories',
                        style: AppConstants.headingBold.copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 130,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount:title.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return CategoriesWidget(
                              name: title[i],
                              image: images[i],
                              color: color[i],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Top Products',
                      //       style:
                      //       AppConstants.headingBold.copyWith(fontSize: 20),
                      //     ),
                      //     Text(
                      //       'See all',
                      //       style: AppConstants.primaryColorHeading.copyWith(),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      //
                      // SizedBox(
                      //   height: screenHeight * 0.280,
                      //   child: ListView.separated(
                      //     shrinkWrap: true,
                      //     itemCount: 3,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, i) {
                      //       return TopProductsWidget(
                      //         image: topProductImage[i],
                      //         price: r'$120',
                      //         desc: topProductdescription[i],
                      //       );
                      //     },
                      //     separatorBuilder: (BuildContext context, int index) {
                      //       return const SizedBox(
                      //         width: 10,
                      //       );
                      //     },
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'New Arrivals',
                        style: AppConstants.headingBold.copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer(
                        builder: (context,ref,_) {
                          var provider= ref.watch(productProvider);
                          var products = provider.productModel?.products;
                          return provider.productModel==null?
                          const CircularProgressIndicator.adaptive():
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(4, (index) {
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                        height: 37,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: selectedIndex == index
                                              ? ColorConstants.primary.withOpacity(0.6)
                                              : Colors.grey.shade100,
                                        ),
                                        child: Center(
                                          child: Text(
                                            titleList[index],
                                            style: selectedIndex == index
                                                ? AppConstants.descriptionWhite
                                                : AppConstants.description,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: products?.length,
                                  itemBuilder: (context, index) {
                                    return  products![index].title!.contains(selectedIndex==0?"GOLD":selectedIndex==1?"SILVER":selectedIndex==2?"PLATINUM":"PALLADIUM")? GestureDetector(
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
                              ),
                            ],
                          );
                        }
                      ) ,
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}