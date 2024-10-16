import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/utils/app_constants.dart';
import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'blog_details/blog_details_screen.dart';
import 'blogs_widget.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: CustomAppBar(
       fineGoldAppBar: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: 3,
          itemBuilder: (context, i) {
            return  GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BlogDetailsScreen()));
                }
                ,
                child: const BlogsWidget());
           }, separatorBuilder: (BuildContext context, int index) {
          return  const SizedBox(
              height: 10,
            );
        },
        ),
      ),
    );
  }
}
