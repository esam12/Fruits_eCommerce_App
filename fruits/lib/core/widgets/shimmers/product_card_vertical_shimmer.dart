import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/shimmers/shimmer_effect.dart';

class ProductCardVerticalShimmer extends StatelessWidget {
  const ProductCardVerticalShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: Sizes.spaceBtwItems),

            // Title
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: Sizes.spaceBtwItems / 2),
            TShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}
