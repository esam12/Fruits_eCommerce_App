import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/image_rounded.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: TRoundedImage(imageUrl: cartItem.productEntity.imageUrl!),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItem.productEntity.name,
                      style: TextStyles.bold13,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.imagesTrash,
                      ),
                    )
                  ],
                ),
                Text(
                  '${cartItem.calculateTotalWeight()} كغ',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    const CartItemActionButtons(
                        // cartItemEntity: carItemEntity,
                        ),
                    const Spacer(),
                    Text(
                      '${cartItem.calculateTotalPrice()} جنيه ',
                      style: TextStyles.bold16
                          .copyWith(color: AppColors.secondaryColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
