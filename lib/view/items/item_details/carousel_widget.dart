import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class CustomImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final bool autoPlay;

  const CustomImageCarousel({
    Key? key,
    required this.imageUrls,
    this.height = 300.0,
    this.autoPlay = true,
  }) : super(key: key);

  @override
  State<CustomImageCarousel> createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffDFE0DF)
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Carousel
          Positioned(
            top: widget.height * 0.1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                items: widget.imageUrls.map((url) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        url,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                controller: _controller,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: widget.autoPlay,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),

          // Left Navigation Arrow
          Positioned(
            left: 16,
            child: GestureDetector(
              onTap: () => _controller.previousPage(),
              child: Image.asset('assets/images/backward.png',height: 18,),
            ),
          ),

          // Right Navigation Arrow
          Positioned(
            right: 16,
            child: GestureDetector(
              onTap: () => _controller.nextPage(),
              child: Image.asset('assets/images/forward.png',height: 18,),
            ),
          ),

          // Bottom Indicators
          Positioned(
            bottom: widget.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageUrls.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _currentIndex == entry.key
                        ? Image.asset('assets/images/carousel_active.png')
                        : Image.asset('assets/images/carousel_inactive.png'),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}