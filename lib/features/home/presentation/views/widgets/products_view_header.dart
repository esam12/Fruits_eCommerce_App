import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});

  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productsLength نتائج',
          style: TextStyles.bold16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.md, vertical: Sizes.sm),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.bordergreyForHeader),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ],
    );
  }
}
