import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/providers/providers.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/color_constants.dart';

class PricesWidget extends StatelessWidget {
  final String? name;
  final String? price;
  final String? fluctuation;
   const PricesWidget({super.key,this.name,this.price,this.fluctuation});

  @override
  Widget build(BuildContext context) {
    return       Container(
      padding:const EdgeInsets.symmetric(horizontal: 10),


      decoration: BoxDecoration(
          color: ColorConstants.black,
          borderRadius: BorderRadius.circular(10)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(name??"",style: AppConstants.headingBold.copyWith(
                fontSize: 16,
                color: Colors.white
            ),),
          ),
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("\$${double.tryParse(price!)?.toStringAsFixed(1) ?? '0.000'}",
     style: AppConstants.description.copyWith(
    fontSize: 16,
    color: const Color(0xffACACAC)
    ),
    )
          ),
          Padding(
            padding: const EdgeInsets.only(left:  0.0),
            child: Text(fluctuation??"",style: AppConstants.description.copyWith(
                color: ColorConstants.green,
                fontSize: 16
            ),),
          )
        ],
      ),
    );
  }
}


class AutoScrollingPrices extends StatefulWidget {
  const AutoScrollingPrices({super.key});

  @override
  _AutoScrollingPricesState createState() => _AutoScrollingPricesState();
}

class _AutoScrollingPricesState extends State<AutoScrollingPrices> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => autoScroll());
  }

  void autoScroll() {
    if (_scrollController.hasClients) {
      final double end = _scrollController.position.maxScrollExtent;
      final double start = _scrollController.position.minScrollExtent;

      const duration = Duration(seconds: 20);

      _scrollController.animateTo(
        end,
        duration: duration,
        curve: Curves.linear,
      ).then((_) {
        _scrollController.animateTo(
          start,
          duration: const Duration(milliseconds: 50),
          curve: Curves.linear,
        ).then((_) {
          if (_scrollController.hasClients) autoScroll();
        });
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer(
        builder: (context, ref, _) {
          var provider = ref.watch(livePriceProvider);
          return SizedBox(
            height: screenHeight * 0.050,
            child:provider.livePriceModel?.livePrices?.length==0 || provider.livePriceModel==null? SizedBox():ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: provider.livePriceModel?.livePrices?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return PricesWidget(
                  name: provider.livePriceModel?.livePrices?[i].description
                      .toString()
                      .replaceAll("Spot", "") ??
                      "",
                  price: provider.livePriceModel?.livePrices?[i].buyOzPrice
                      .toString()
                      .replaceAll("Spot", "") ??
                      "",
                  fluctuation: "+64.38",
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          );
        }
    );
  }
}