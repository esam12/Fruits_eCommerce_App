import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price});

  final String title, subTitle, price;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding:
          const EdgeInsets.symmetric(vertical: Sizes.md, horizontal: Sizes.md),
      backgroundColor: AppColors.borderPrimary.withValues(alpha: 0.2),
      radius: 8.0,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: AppColors.greyTextColor),
                ),
              ),
            ),
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
    );
  }
}
