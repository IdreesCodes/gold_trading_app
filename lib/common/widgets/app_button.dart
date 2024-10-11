import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.isBorder = false,
    this.title = '',
    this.height = 45,
    this.borderRadius = 10,
    this.width,
    this.bgColor,
    this.border,
    this.icon,
    this.alignment = Alignment.center,
    required this.onPress,
    this.loader = false,
    this.titleTextStyle,
  });
  final String title;
  final bool isBorder;
  final TextStyle? titleTextStyle;
  final Border? border;
  final double borderRadius;
  final VoidCallback onPress;
  final Widget? icon;
  final Color? bgColor;
  final double? height;
  final double? width;
  final Alignment alignment;
  bool loader;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (loader == false) {
          onPress();
        }
      },
      child:
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border==null? Border.all(
            color: ColorConstants.primary.withOpacity(0.5)
          ):border,
          color: bgColor,
          gradient: bgColor==null?LinearGradient(
            colors: [
              ColorConstants.primary,
              ColorConstants.primary
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            // stops: [0.0, 1.0],
            // tileMode: TileMode.clamp,
          ):null,
        ),
        alignment: alignment,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null)
              const SizedBox(
                width: 5,
              ),
            loader?const CircularProgressIndicator(color: Colors.white,):Text(
              title,
              style: titleTextStyle??AppConstants.description.copyWith(color: Colors.white,fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
