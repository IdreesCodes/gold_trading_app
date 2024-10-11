import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:fine_gold_flutter/view/live_price/widgets/calender_widget.dart';
import 'package:fine_gold_flutter/view/live_price/widgets/chart_widget.dart';
import 'package:fine_gold_flutter/view/live_price/widgets/data_Table_widget.dart';
import 'package:flutter/material.dart';

class LivePricesScreen extends StatefulWidget {
  const LivePricesScreen({super.key});

  @override
  State<LivePricesScreen> createState() => _LivePricesScreenState();
}

class _LivePricesScreenState extends State<LivePricesScreen> {
  int selectedIndex = 0;
 List<String> titleList=[
   'Gold',
   'Silver',
   'Platinum',
   'Palladium'
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Live Price',
      ),
      body:  Padding(
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
                    color:  selectedIndex == index ?ColorConstants.primary: Colors.grey.shade100,
                  ),
                  child: Center(
                    child: Text(
                      titleList[index],
                      style: selectedIndex == index? AppConstants.descriptionWhite: AppConstants.description,
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
                border: Border.all(
                  color: Colors.grey.shade200
                )
              ),
              child:  Padding(
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
                            Text(r'$234.45 CAD', style: AppConstants.descriptionBold.copyWith(fontSize: 16),),
                            Text('March 7 2024, 23:00', style: AppConstants.descriptionBold.copyWith(fontSize: 10,color: Colors.grey),),
                          ],
                        ),
                        const CalenderWidget(),

                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ChartWidget(),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const DataTableWidget(),
          ],
        ),
      ),
    );
  }
}
