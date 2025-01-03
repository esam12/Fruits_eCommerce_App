import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: const BoxDecoration(
          color: AppColors.notificationItemBackground),
      child: Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: TextStyles.regular13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
