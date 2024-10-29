import 'package:fine_gold_flutter/common/widgets/app_button.dart';
import 'package:fine_gold_flutter/model/product_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/view/items/item_details/product_specs_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/widgets/custom_app_bar.dart';
import 'carousel_widget.dart';

class ItemDetailScreen extends StatefulWidget {
  ItemDetailScreen({super.key,required this.products});
  Products products;
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  List<String> imagesUrl = [];
  @override
  void initState() {
    // TODO: implement initState
    imagesUrl.add(widget.products.imageUrl??"");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageCarousel(
                autoPlay: true,
                imageUrls: imagesUrl,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                  textAlign: TextAlign.start,
                  widget.products.title??"",
                  style: AppConstants.headingBold),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  r'$''${widget.products.price}',
                  style: AppConstants.primaryColorDescription
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.products.stockStatus=="instock"?const Color(0xffECFDF3):
                      const Color(0xfffadede)),
                  child: Center(
                      child: Text(
                    widget.products.stockStatus=="instock"?'In Stock':'Out of Stock',
                    style: AppConstants.description
                        .copyWith(color: widget.products.stockStatus=="instock"?const Color(0xff027A48):Colors.red),
                  )),
                ),
              ]),
              // const SizedBox(
              //   height: 15,
              // ),
              // Text(
              //   'Product Specifications',
              //   style: AppConstants.headingBold,
              // ),
              const SizedBox(
                height: 15,
              ),
              Html(data:widget.products.shortDescription!.replaceAll("Metal Type", "<strong>Metal Type  </strong>").replaceAll("Weight", "<strong>Weight    </strong>").replaceAll("Family", "<strong>Family  </strong> ").replaceAll("Purity", "<strong>Purity  </strong> ")),
              // const ProductSpecificationsWidget(
              //   keys: "Metal Type ",
              //   values: 'Silver',
              // ),
              // const ProductSpecificationsWidget(
              //   keys: "Weight ",
              //   values: '10 Ounce',
              // ),
              // const ProductSpecificationsWidget(
              //   keys: "Family ",
              //   values: 'Royal Canadian Mint',
              // ),
              // const ProductSpecificationsWidget(
              //   keys: "Purity ",
              //   values: '0.999',
              // ),
              const SizedBox(
                height: 15,
              ),
              widget.products.description==""?const SizedBox():Text(
                'Description',
                style: AppConstants.headingBold,
              ),
              const SizedBox(
                height: 10,
              ),
              Html(data:widget.products.description),
              // const Text(
              //     '''Gold Stock offers 10 OZ SILVER ROYAL CANADIAN MINT BAR at competitive prices. Our bars are stamped with the Royal Canadian Mint logo and a distinct serial number. The 10 oz Silver Royal Canadian Mint Bar is engraved with the highest quality by the mint and is made of. 9999 silver. The weight and purity are printed immediately on each bar, and the classic insignia is surrounded by the name of the mint in both English and French.'''),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onPress: () {

                  },
                  title: 'Call Now',
                  bgColor: Colors.white,
                  titleTextStyle: AppConstants.primaryColorDescription
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onPress: () async {
                  try {
                    final url = Uri.parse("https://finegoldbullion.ca/checkout/?add-to-cart=${widget.products.id}&quantity=1");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  } catch (e) {
                    print("Error launching URL: $e");
                  }
                },
                title: 'Add to Cart',
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
