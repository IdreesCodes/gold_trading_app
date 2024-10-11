import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class BlogsWidget extends StatefulWidget {
  const BlogsWidget({super.key});

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,

      decoration: BoxDecoration(
         
          border: Border.all(
              color: Colors.grey.shade100
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/blogs.png'),
          const SizedBox(
            height: 20,
          ),
          Text('18 Jan 2022', style: AppConstants.primaryColorDescription,),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gold Stock Rates',style: AppConstants.headingBold,),
              const Icon(CupertinoIcons.arrow_up_right, )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text('''The rise of RESTful APIs has been met by a rise in tools for creating, testing, and managing them.''',style: AppConstants.description.copyWith(
              fontSize: 16
          ),),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffECFDF3)
                ),
                child: Center(child: Text('Gold Price',style: AppConstants.description.copyWith(color: const Color(0xff027A48)),)),

              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFDF2FA)
                ),
                child: Center(child: Text('Gold Stocks',style: AppConstants.description.copyWith(color: const Color(0xffC11574)),)),

              ),
            ],
          ),

        ],
      ),
    );
  }
}
