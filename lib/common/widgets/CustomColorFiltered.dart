import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';

class CustomColorFiltered extends StatelessWidget {
  const CustomColorFiltered({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        ColorConstants.primary,
        BlendMode.hue,
      ),
      child: child,
    );
  }
}
