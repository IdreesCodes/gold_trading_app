import 'package:flutter/material.dart';


class SplashScreenAnimation extends StatefulWidget {
  const SplashScreenAnimation({super.key});

  @override
  State<SplashScreenAnimation> createState() => _SplashScreenAnimationState();
}

class _SplashScreenAnimationState extends State<SplashScreenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoSizeAnimation;
  late Animation<double> _backgroundSizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoSizeAnimation = Tween<double>(begin: 100.0, end: 50.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);

    _backgroundSizeAnimation = Tween<double>(begin: 100.0, end: 2000.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Center(
                child: Container(
                  width: _backgroundSizeAnimation.value,
                  height: _backgroundSizeAnimation.value,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: _logoSizeAnimation.value,
                  height: _logoSizeAnimation.value,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FlutterLogo(
                      size: _logoSizeAnimation.value / 2,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



