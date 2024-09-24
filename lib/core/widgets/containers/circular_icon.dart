import 'package:flutter/material.dart';
import 'package:fruits/core/helper/functions/helper_functions.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = Sizes.lg,
    required this.icon,
    this.color,
    this.backgroundcolor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundcolor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundcolor ??
            (dark
                ? AppColors.blackButtonColor.withOpacity(0.9)
                : AppColors.whiteColor.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
