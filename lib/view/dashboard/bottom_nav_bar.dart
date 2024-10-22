import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:fine_gold_flutter/view/blogs/blog_screen.dart';
import 'package:fine_gold_flutter/view/live_price/live_price_screen.dart';
import 'package:fine_gold_flutter/view/settings/settings_screen.dart';
import 'package:flutter/material.dart';

import '../category/category_screen.dart';
import '../category/category_sub_page/category_sub_page_screen.dart';
import '../homescreen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LivePricesScreen(),
    Container(),
    const CategorySubPageScreen(),
    const BlogScreen(),
  ];

  void _onTap(int index) {
    if (index == 2) {
      _showBottomSheet();
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 250,
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
                Text('Menu',style: AppConstants.headingBold.copyWith(
                  fontSize: 22
                ),),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BlogScreen()));

                        },
                        child: Container(


                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.grey.shade200
                            )
                          ),
                          child: Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/messages.png",height: 40,width: 40,),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Blogs',style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700
                                ),)
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));

                        },
                        child: Container(

                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.grey.shade200
                            )
                          ),
                          child: Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/settings-01.png",height: 40,width: 40,),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Settings',style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700
                                ),)
                              ],
                            ),
                          )
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConstants.primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          color: ColorConstants.primary,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24, height: 24,
            ),
            activeIcon: Image.asset(
              'assets/images/home_active.png',
              width: 24, height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/live_chart.png',
              width: 24, height: 24,
            ),
            activeIcon: Image.asset(
              'assets/images/live_chart_active.png',
              width: 24, height: 24,
            ),
            label: 'Live Prices',
          ),
           BottomNavigationBarItem(
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,color: ColorConstants.primary

              ),
              child: const Icon(Icons.expand_less_outlined,color: Colors.white,),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/cart.png',
              width: 24, height: 24,
            ),
            activeIcon: Image.asset(
              'assets/images/cart_active.png',
              width: 24, height: 24,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/category.png',
              width: 24, height: 24,
            ),
            activeIcon: Image.asset(
              'assets/images/category_active.png',
              width: 24, height: 24,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
