import 'dart:async';

import 'package:fine_gold_flutter/view/dashboard/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';

class AnimationScreen extends StatefulWidget {
  final Widget nextScreen;

  const AnimationScreen({
    Key? key,
    required this.nextScreen,
  }) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<double> _expandingCircleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );


    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.9), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));


    _expandingCircleAnimation = Tween<double>(begin: 0.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.7, 1.0, curve: Curves.fastOutSlowIn)),
    );


    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: ColorConstants.white,
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)));
    _controller.forward().then((_) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget.nextScreen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _colorAnimation.value,
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [

                ClipOval(
                  clipper: ExpandingCircleClipper(scale: _expandingCircleAnimation.value, maxSize: MediaQuery.of(context).size),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Transform.scale(
                  scale: _bounceAnimation.value,
                  child: Image.asset(
                    'assets/images/splash_screen_icon.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class ExpandingCircleClipper extends CustomClipper<Rect> {
  final double scale;
  final Size maxSize;

  ExpandingCircleClipper({required this.scale, required this.maxSize});

  @override
  Rect getClip(Size size) {

    final double maxRadius = maxSize.width > maxSize.height ? maxSize.width : maxSize.height;
    final double radius = maxRadius * scale;
    return Rect.fromCircle(center: Offset(maxSize.width / 2, maxSize.height / 2), radius: radius);
  }

  @override
  bool shouldReclip(covariant ExpandingCircleClipper oldClipper) {
    return oldClipper.scale != scale;
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start the timer to navigate after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const BottomNavBar(), // Replace with your actual next screen
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(

          gradient: LinearGradient(
            colors: [
              ColorConstants.primary.withOpacity(0.3),
              ColorConstants.primary.withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/app_icon.png',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 40),
             CircularProgressIndicator(
              color: ColorConstants.primary,
            ),
          ],
        ),
      ),
    );
  }
}

// class CenterImageWidget extends StatelessWidget {
//
//   const CenterImageWidget({super.key});
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration:  BoxDecoration(
//           gradient: LinearGradient(
//               colors: [
//                 ColorConstants.primary.withOpacity(0.1),
//                 ColorConstants.primary.withOpacity(0.5),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               tileMode: TileMode.decal
//           ),
//         ),
//         child: Center(
//           child: Image.asset(
//             'assets/images/app_icon.png',
//             width: 50,
//             height: 50,
//           ),
//         ),
//       ),
//     );
//   }
// }


