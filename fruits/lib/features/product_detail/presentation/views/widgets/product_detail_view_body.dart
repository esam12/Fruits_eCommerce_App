import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/cart/add_remove_to_cart.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';
import 'package:fruits/core/widgets/containers/image_rounded.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';
import 'package:fruits/core/widgets/curved_edges/curved_edges_widget.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({super.key, required this.product});

  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TCurvedEdgesWidget(
            child: Container(
              height: 360,
              decoration: const BoxDecoration(
                color: AppColors.gridColor,
              ),
              child: Center(
                child: SizedBox(
                  width: 220,
                  child: TRoundedImage(
                    imageUrl: product!.productImage,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product!.productName,
                      style: TextStyles.bold16,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ' ${product!.productPrice} جنية / الكيلو',
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ],
                ),
                AddAndRemoveToCart(product: product!),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Icon(
                  Iconsax.star1,
                  color: AppColors.iconStartColor,
                ),
                Text.rich(
                  TextSpan(
                    text: product!.productRating.toString(),
                    style: TextStyles.semiBold13,
                    children: [
                      TextSpan(
                        text: '   (${product!.productRatingCount}+)',
                        style: TextStyles.semiBold13.copyWith(
                          color: const Color(0xFF9796A1),
                        ),
                      ),
                      const TextSpan(text: '   '),
                      TextSpan(
                        text: 'المراجعه',
                        style: TextStyles.bold13.copyWith(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              product!.productDescription.toString(),
              style: TextStyles.regular13.copyWith(color: AppColors.iconColor),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TGridLayout(
                itemCount: 4,
                mainAxisExtent: 80,
                itemBuilder: (contex, index) {
                  return TRoundedContainer(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 25.0),
                    showBorder: true,
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        /// Text
                        // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the verical center and also
                        // to keep text inside the boundaries.
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'عام',
                                style: TextStyles.bold16.copyWith(
                                    color: AppColors.lightGreenTextColor),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "الصلاحيه",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.semiBold13
                                    .copyWith(color: AppColors.iconColor),
                              )
                            ],
                          ),
                        ),

                        /// Icon
                        const Flexible(
                          child: CircularImage(
                            image: 'assets/images/calendar.png',
                            isNetworkImage: false,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
