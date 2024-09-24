import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/circular_container.dart';

class CheckoutListTileItem extends StatelessWidget {
  const CheckoutListTileItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.suTitle,
    required this.totalPrice,
  });

  final bool isSelected;
  final String title;
  final String suTitle;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.borderPrimary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          width: 1.0,
        ),
      ),
      child: ListTile(
        leading: TCircularContainer(
          backgroundColor: isSelected
              ? AppColors.primaryColor
              : AppColors.borderPrimary.withOpacity(0.2),
          isBorder: isSelected ? false : true,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.semiBold13,
            ),
            const SizedBox(height: 6.0),
            Text(
              suTitle,
              style: TextStyles.regular13
                  .copyWith(color: AppColors.checkoutTextItemColor),
            ),
          ],
        ),
        trailing: Text(
          totalPrice,
          style:
              TextStyles.bold13.copyWith(color: AppColors.darkGreenTextColor),
        ),
      ),
    );
  }
}
