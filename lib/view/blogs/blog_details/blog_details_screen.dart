import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({super.key});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/images/blogs.png'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('18 Jan 2022 .10 min read', style: AppConstants.primaryColorDescription.copyWith(
                      fontWeight: FontWeight.w600
                    ),),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Gold Stock Rates',style: AppConstants.headingBold.copyWith(
                        fontSize: 36
                    ),),

                    const SizedBox(
                      height: 5,
                    ),
                    Text('''The rise of RESTful APIs has been met by a rise in tools for creating, testing, and managing them. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper mattis lorem non. Ultrices praesent amet ipsum justo massa. Eu dolor aliquet risus gravida nunc at feugiat consequat purus. Non massa enim vitae duis mattis. Vel in ultricies vel fringilla.''',style: AppConstants.description.copyWith(
                        fontSize: 16
                    ),),
                    const SizedBox(
                      height: 10,
                    ),

                    Divider(

                      color: Colors.grey.shade100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Introduction',style: AppConstants.headingBold.copyWith(
                      fontSize: 24
                    ),),
                    Text('''The rise of RESTful APIs has been met by a rise in tools for creating, testing, and managing them. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper mattis lorem non. Ultrices praesent amet ipsum justo massa. Eu dolor aliquet risus gravida nunc at feugiat consequat purus. Non massa enim vitae duis mattis. Vel in ultricies vel fringilla.''',style: AppConstants.description.copyWith(
                        fontSize: 16
                    ),),const SizedBox(
                      height: 20,
                    ),
                    Divider(

                      color: Colors.grey.shade100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Share this post',style: AppConstants.headingBold.copyWith(color: Colors.grey),),
                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                              
                            ),
                            borderRadius: BorderRadius.circular(10)
                                
                          ),
                          child:  Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.copy,size: 20,),
                                Text('Copy Link',style: AppConstants.descriptionBold)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.shade400
                                )
                          ),
                          child: Icon(Icons.facebook,color: Colors.grey.shade500,),
                        ),

                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade400
                              )
                          ),
                          child: Icon(Icons.facebook,color: Colors.grey.shade500,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade400
                              )
                          ),
                          child: Icon(Icons.facebook,color: Colors.grey.shade500,),
                        )
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
