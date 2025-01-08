import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    this.onTap,
  });

  final String title, subTitle, price;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.md, horizontal: Sizes.md),
        backgroundColor: AppColors.borderPrimary.withValues(alpha: 0.2),
        showBorder: isSelected,
        borderColor: AppColors.primaryColor,
        radius: 8.0,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              const SizedBox(width: Sizes.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.semiBold13,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    subTitle,
                    style: TextStyles.regular13
                        .copyWith(color: AppColors.checkoutTextItemColor),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  '$price ليرة',
                  style: TextStyles.bold13
                      .copyWith(color: AppColors.darkGreenTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: AppColors.greyTextColor),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
