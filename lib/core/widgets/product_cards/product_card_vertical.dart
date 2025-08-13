import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/favorite/favorite_cubit.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/image_rounded.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';
import 'package:fruits/features/home/presentation/cubit/cart_cubit.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteCubit>(),
      child: Container(
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
                    child:
                        product.imageUrl != null && product.imageUrl!.isNotEmpty
                            ? TRoundedImage(
                                imageUrl: product.imageUrl ?? '',
                                applyImageRadius: true,
                                isNetworkImage: true,
                              )
                            : const Icon(Icons.error),
                  ),

                  /// Wishlist Button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        if (state is FavoriteSuccess) {
                          final isFav = state.favorites.contains(product.id);
                          return IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              context
                                  .read<FavoriteCubit>()
                                  .toggleFavorite(product.id);
                            },
                          );
                        }
                        return const Icon(Icons.favorite_border, color: Colors.grey);
                      },
                    ),
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
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyles.semiBold13,
                        ),
                        const SizedBox(height: 4.0),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${product.price} جنية ',
                                style: TextStyles.bold13
                                    .copyWith(color: AppColors.secondaryColor),
                              ),
                              TextSpan(
                                text: '/ كغ',
                                style: TextStyles.semiBold13.copyWith(
                                    color: AppColors.lightSecondaryColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Add To Cart Button Circle
                  GestureDetector(
                    onTap: () => context.read<CartCubit>().addCartItem(product),
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
