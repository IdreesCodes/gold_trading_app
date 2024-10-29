import 'package:fine_gold_flutter/common/widgets/app_text_field.dart';
import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/view/category/selected_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../common/providers/providers.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../homescreen/widgets/top_products_widget.dart';
import '../items/item_details/item_detail_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  void filtersBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Consumer(
              builder: (context,ref,_) {
                var provider=ref.watch(productProvider);
                return SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),

                    child:  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Filters',style: AppConstants.headingBold.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                          ),),
                          const SizedBox(
                            height: 15,
                          ),
                          Text('Price Range',style: AppConstants.headingBold.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppTextFormField(
                                  controller: outProvider.filterMinPriceController,
                                  hintText: "Min price",
                                  textInputType: const TextInputType.numberWithOptions(),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(6), // Limit input to 6 characters
                                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                  ],
                                  border: Border.all(color: Colors.black
                                  ),
                                  onChanged: (value){
                                    if(double.parse(value)>double.parse(outProvider.filterMaxPriceController.text==""?"0":outProvider.filterMaxPriceController.text)||outProvider.filterMaxPriceController.text==''){
                                      outProvider.filterMaxPriceController.text=outProvider.filterMinPriceController.text;
                                    }
                                    provider.setFilterValue();
                                  },
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
                                  controller: outProvider.filterMaxPriceController,
                                  hintText: "Max price",
                                  border: Border.all(color: Colors.black),
                                  textInputType: const TextInputType.numberWithOptions(),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(6), // Limit input to 6 characters
                                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                  ],
                                  onChanged: (value){
                                    if(double.parse(value)<double.parse(outProvider.filterMinPriceController.text)){
                                      outProvider.filterMinPriceController.text=outProvider.filterMaxPriceController.text;
                                    }
                                    provider.setFilterValue();
                                  },
                                  backgroundColor: Colors.grey.shade100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SfRangeSlider(
                            activeColor: ColorConstants.primary,
                            min: 0.0,
                            max: 999999.0,
                            values: provider.values,
                            interval: 100000,
                            showTicks: true,
                            // showLabels: true,
                            enableTooltip: false,
                            minorTicksPerInterval: 1,
                            onChanged: (SfRangeValues values){

                                provider.filterMinPriceController.text=double.parse(values.start.toString()).toStringAsFixed(0);
                                provider.filterMaxPriceController.text=double.parse(values.end.toString()).toStringAsFixed(0);
                                provider.setFilterValue();

                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text('Product Status',style: AppConstants.headingBold.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600 ),),
                          const SizedBox(
                            height: 10,
                          ),
                          const StockStatusWidget(),
                          const SizedBox(
                            height: 19,
                          ),
                          // Text('Category',style: AppConstants.headingBold.copyWith(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.w600
                          // ),),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: List.generate(3, (index) {
                          //     return GestureDetector(
                          //       onTap: () {
                          //         setState(() {
                          //           selectedIndex = index;
                          //         });
                          //       },
                          //       child: Container(
                          //
                          //         margin: const EdgeInsets.symmetric(horizontal: 5),
                          //         padding: const EdgeInsets.symmetric(horizontal: 15),
                          //         height: 40,
                          //
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(20),
                          //           color:  selectedIndex == index ?ColorConstants.primary: Colors.grey.shade100,
                          //         ),
                          //         child: Center(
                          //           child: Text(
                          //             titleList[index],
                          //             style: selectedIndex == index? AppConstants.descriptionWhite: AppConstants.description,
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   }),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // AbsorbPointer(
                          //   child: AppTextFormField(
                          //     suffixIcon: const Icon(Icons.expand_more,size: 24,),
                          //     hintText: "Sub Categories",
                          //     backgroundColor: Colors.grey.shade100,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          },
        );
      },
    );
  }
  void categoriesBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
                  Text('Gold Bars',style: AppConstants.headingBold.copyWith(
                      fontSize: 22
                  ),),

                  const SizedBox(
                    height: 19,
                  ),




                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                      hintText: "All",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),

                      hintText: "1 gram gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                      hintText: "5 gram gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                      hintText: "10 gram gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ), AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                      hintText: "50 gram gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              AbsorbPointer(
                child: AppTextFormField(
                  hintTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                  hintText: "100 gram gold bar",
                  backgroundColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(
                height: 10,),
                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                      hintText: "1 kilo gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,),  const SizedBox(
                height: 10,),
                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                      hintText: "1 ounce gram gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,),  const SizedBox(
                height: 10,),
                  AbsorbPointer(
                    child: AppTextFormField(
                      hintTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                      hintText: "10 ounce gram gold bar",
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }



  var outProvider;
  int selectedIndex = 0;
  List<String> titleList=[
    'All',
    // 'Gold bars',
    // 'Gold Coins',
  ];

  @override
  void initState() {
    // TODO: implement initState
    outProvider=ref.read(productProvider);
    super.initState();
  }
  @override
  void dispose() {
    outProvider.removeFilter();
    // TODO: implement dispose
    super.dispose();
  }
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        var provider=ref.watch(productProvider);
        // var allProducts = provider.productModel?.products;
        var allProducts = provider.getSearchProducts();
        var products = allProducts.where((product) => product.title!.toLowerCase().contains(provider.searchController.text.toLowerCase())).toList();

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: isSearching
                ? TextField(
              controller: provider.searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              autofocus: true,
              onChanged: (query) {
                // Handle the search query here
                setState(() {

                });
                debugPrint("Searching for $query");
              },
            )
                : const Text('Search'),
            actions: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isSearching = !isSearching;
                      if (!isSearching) {
                        provider.searchController.clear();
                      }
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Image.asset('assets/images/search.png',height: 22,width: 22,),
                  ),
                ),
                GestureDetector(
                  onTap: filtersBottomSheet,
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
                    children: List.generate(titleList.length, (index) {
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
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // GestureDetector(
                  //   onTap: (){
                  //
                  //       categoriesBottomSheet();
                  //
                  //   },
                  //   child: AbsorbPointer(
                  //     child: AppTextFormField(
                  //       suffixIcon: const Icon(Icons.expand_more,size: 24,),
                  //       hintText: "Sub Categories",
                  //       backgroundColor: Colors.grey.shade100,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  provider.productModel==null?
                  const CircularProgressIndicator.adaptive():
                  Expanded(
                    child: GridView.builder(
                      itemCount: products?.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {

                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetailScreen(products: products[index],)));
                          },
                          child:
                          TopProductsWidget(
                            image: products[index].imageUrl??'',
                            price: products[index].price??'',
                            desc:  products[index].title??'',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
        );
      }
    );
  }
}
