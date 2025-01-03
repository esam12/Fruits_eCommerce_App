import 'package:flutter/material.dart';
import 'package:fruits/core/models/product_model.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/cart/add_remove_to_cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 92,
                width: 73,
                decoration: const BoxDecoration(
                  color: AppColors.gridColor,
                ),
                child: Image.asset(
                  'assets/images/product2.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'بطيخ',
                    style: TextStyles.bold13,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '3 كغ',
                    style: TextStyles.regular13.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  AddAndRemoveToCart(
                    width: 30,
                    height: 30,
                    size: 16,
                    product: ProductModel.empty(),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.delete_outline, color: AppColors.primaryColor),
              const SizedBox(height: 30),
              Text(
                '60 جنيه ',
                style:
                    TextStyles.bold16.copyWith(color: AppColors.secondaryColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
