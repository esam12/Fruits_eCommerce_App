import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
        child: CartItem(
          cartItem: cartItems[index],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.dividerColor,
      height: 22,
    );
  }
}
