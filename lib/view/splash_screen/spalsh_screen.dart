import 'package:fine_gold_flutter/utils/color_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(

            colors: [
              ColorConstants.primary.withOpacity(0.3),
              ColorConstants.primary.withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/app_icon.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
