import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/home/presentation/cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration:
          const BoxDecoration(color: AppColors.notificationItemBackground),
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
          style: TextStyles.regular13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
