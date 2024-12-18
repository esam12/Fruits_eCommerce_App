
import 'package:flutter/material.dart';
import 'package:fruits/core/helper/functions/helper_functions.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.raduis = 15.0,
      this.color});

  final double width, height, raduis;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? AppColors.gridColor : AppColors.whiteColor),
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
    );
  }
}
