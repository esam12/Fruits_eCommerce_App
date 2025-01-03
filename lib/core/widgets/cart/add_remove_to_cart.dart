import 'package:flutter/material.dart';
import 'package:fruits/core/models/product_model.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/circular_icon.dart';
import 'package:iconsax/iconsax.dart';

class AddAndRemoveToCart extends StatelessWidget {
  const AddAndRemoveToCart({
    super.key,
    this.width,
    this.height,
    this.size, required this.product,
  });

  final double? width, height, size;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          icon: Iconsax.add,
          backgroundcolor: AppColors.primaryColor,
          width: width,
          height: height,
          size: size,
          color: AppColors.whiteColor,
          onPressed: () {},
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        const Text('2', style: TextStyles.bold16),
        const SizedBox(width: Sizes.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.minus,
          backgroundcolor: AppColors.gridColor,
          width: width,
          height: height,
          size: size,
          color: AppColors.iconColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
