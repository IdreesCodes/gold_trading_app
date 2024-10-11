import 'package:fine_gold_flutter/view/blogs/blog_details/blog_details_screen.dart';
import 'package:fine_gold_flutter/view/blogs/blog_screen.dart';
import 'package:fine_gold_flutter/view/category/category_screen.dart';
import 'package:fine_gold_flutter/view/homescreen/home_screen.dart';
import 'package:fine_gold_flutter/view/items/item_details/item_detail_screen.dart';
import 'package:fine_gold_flutter/view/live_price/live_price_screen.dart';
import 'package:fine_gold_flutter/view/settings/settings_screen.dart';
import 'package:fine_gold_flutter/view/splash_screen/spalsh_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fine Gold',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const CategoryScreen(),
    );
  }
}

