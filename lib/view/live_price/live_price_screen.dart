import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:fine_gold_flutter/view/live_price/widgets/calender_widget.dart';
import 'package:fine_gold_flutter/view/live_price/widgets/chart_widget.dart';
import 'package:fine_gold_flutter/view/live_price/widgets/data_Table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/providers/providers.dart';

class LivePricesScreen extends ConsumerStatefulWidget {
  const LivePricesScreen({super.key});

  @override
  ConsumerState<LivePricesScreen> createState() => _LivePricesScreenState();
}

class _LivePricesScreenState extends ConsumerState<LivePricesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(livePriceProvider).callGetLivePricesApi();

  }

  int selectedIndex = 0;
 List<String> titleList=[
   'Gold',
   'Silver',
   'Platinum',
   'Palladium'
 ];
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(livePriceProvider);
    var data = [0.0, 3.0,2.0, 3.0, 4.0, 6.0,4.0,3.0];

    return Consumer(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            fineGoldAppBar: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
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
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 37,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedIndex == index
                                ? ColorConstants.primary
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.livePriceModel?.livePrices?[selectedIndex].description.toString() ?? "",
                                  style: AppConstants.descriptionBold.copyWith(fontSize: 16),
                                ),
                                Text(
                                  DateFormat('MMMM d yyyy, HH:mm').format(DateTime.now()),
                                  style: AppConstants.descriptionBold.copyWith(fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            ),
                            // const CalenderWidget(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        if (selectedIndex == 0)
                          LineChartWidget(data: provider.goldList)
                        else if (selectedIndex == 1)
                          LineChartWidget(data: provider.silverList)
                        else if (selectedIndex == 2)
                            LineChartWidget(data: provider.platinumList)
                          else if (selectedIndex == 3)
                              LineChartWidget(data: provider.palladiumList),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                if(selectedIndex==0)
                DataTableWidget(spotBuy: provider.livePriceModel?.livePrices?[0].buyOzPrice.toString()??"", spotSell: provider.livePriceModel?.livePrices?[0].sellOzPrice??"", ounceBuy: provider.livePriceModel?.livePrices?[0].buyOzPrice??"", ounceSell: provider.livePriceModel?.livePrices?[0].sellOzPrice??"", kiloBuy: provider.livePriceModel?.livePrices?[0].buyKgPrice??"", kiloSell: provider.livePriceModel?.livePrices?[0].sellKgPrice??"")
        else if (selectedIndex == 1)
                DataTableWidget(spotBuy: provider.livePriceModel?.livePrices?[1].buyOzPrice.toString()??"", spotSell: provider.livePriceModel?.livePrices?[1].sellOzPrice??"", ounceBuy: provider.livePriceModel?.livePrices?[1].buyOzPrice??"", ounceSell: provider.livePriceModel?.livePrices?[1].sellOzPrice??"", kiloBuy: provider.livePriceModel?.livePrices?[1].buyKgPrice??"", kiloSell: provider.livePriceModel?.livePrices?[1].sellKgPrice??"")
        else if (selectedIndex == 2)
                DataTableWidget(spotBuy: provider.livePriceModel?.livePrices?[2].buyOzPrice.toString()??"", spotSell: provider.livePriceModel?.livePrices?[2].sellOzPrice??"", ounceBuy: provider.livePriceModel?.livePrices?[2].buyOzPrice??"", ounceSell: provider.livePriceModel?.livePrices?[2].sellOzPrice??"", kiloBuy: provider.livePriceModel?.livePrices?[2].buyKgPrice??"", kiloSell: provider.livePriceModel?.livePrices?[2].sellKgPrice??"")
                  else if (selectedIndex == 3)
                DataTableWidget(spotBuy: provider.livePriceModel?.livePrices?[3].buyOzPrice.toString()??"", spotSell: provider.livePriceModel?.livePrices?[3].sellOzPrice??"", ounceBuy: provider.livePriceModel?.livePrices?[3].buyOzPrice??"", ounceSell: provider.livePriceModel?.livePrices?[3].sellOzPrice??"", kiloBuy: provider.livePriceModel?.livePrices?[3].buyKgPrice??"", kiloSell: provider.livePriceModel?.livePrices?[3].sellKgPrice??""),
              ],
            ),
          ),
        );
      },
    );

  }
}
