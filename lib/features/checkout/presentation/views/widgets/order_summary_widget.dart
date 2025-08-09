import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/orders/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:provider/provider.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب: ',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} ليرة',
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
          const Divider(thickness: .5, indent: 50, endIndent: 50),
          const SizedBox(height: Sizes.sm),
          Row(
            children: [
              const Text(
                'المجموع الكلي: ',
                style: TextStyles.bold16,
              ),
              const Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30.0} ليرة',
                style: TextStyles.bold16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
