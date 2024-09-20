import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/image_rounded.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: AppColors.gridColor),
      child: Column(
        children: [
          TRoundedContainer(
            height: 185,
            backgroundColor: AppColors.gridColor,
            padding: const EdgeInsets.all(Sizes.sm),
            child: Stack(
              children: [
                /// Thumbanil Image

                Center(
                  child: TRoundedImage(
                    imageUrl: product.productImage,
                    applyImageRadius: true,
                    isNetworkImage: true,
                    
                  ),
                ),

                /// Wishlist Button
                const Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(Icons.favorite_outline),
                ),
              ],
            ),
          ),

          const Spacer(),

          /// Price & Add To Cart Button

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: TextStyles.semiBold13,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${product.productPrice} جنية / الكيلو',
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.secondaryColor),
                    )
                  ],
                ),

                /// Add To Cart Button Circle
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primaryColor,
                  ),
                  child: const SizedBox(
                    width: Sizes.iconLg * 1.2,
                    height: Sizes.iconLg * 1.2,
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
