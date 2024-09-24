
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/circular_container.dart';

class CheckoutHeaderItem extends StatelessWidget {
  const CheckoutHeaderItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.no,
  });

  final String title;
  final String no;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularContainer(
          backgroundColor: isSelected
              ? AppColors.primaryColor
              : AppColors.checkoutItemBackground,
          child: isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )
              : Text(
                  no,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold13,
                ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: TextStyles.bold13.copyWith(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.checkoutTextItemColor,
          ),
        ),
      ],
    );
  }
}
