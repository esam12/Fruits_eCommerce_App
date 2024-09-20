import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 23,
    this.height = 23,
    this.radius = 23,
    this.padding = 0,
    this.child,
    required this.backgroundColor,
    this.margin,
    this.isBorder,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final bool? isBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: isBorder == true
            ? Border.all(color: AppColors.greyTextColor)
            : null,
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
