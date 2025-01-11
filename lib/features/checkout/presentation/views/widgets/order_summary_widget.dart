
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب: ',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي: ',
                style: TextStyles.regular13.copyWith(
                  color: AppColors.greyDarkTextColor,
                ),
              ),
              const Spacer(),
              const Text(
                '150.0 ليرة',
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Text(
                'التوصيل: ',
                style: TextStyles.regular13.copyWith(
                  color: AppColors.greyDarkTextColor,
                ),
              ),
              const Spacer(),
              Text(
                '30.0 ليرة',
                style: TextStyles.regular13.copyWith(
                  color: AppColors.greyDarkTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.sm),
          const Divider(thickness: .5),
          const SizedBox(height: Sizes.sm),
          const Row(
            children: [
              Text(
                'المجموع الكلي: ',
                style: TextStyles.bold16,
              ),
              Spacer(),
              Text(
                '180.0 ليرة',
                style: TextStyles.bold16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
