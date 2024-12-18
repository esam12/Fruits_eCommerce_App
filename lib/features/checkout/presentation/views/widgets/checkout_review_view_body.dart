import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/row/tow_text_and_space_between.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_header_item.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_payment_item.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutReviewViewBody extends StatelessWidget {
  const CheckoutReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Row(
              children: [
                CheckoutHeaderItem(
                  title: 'الشحن',
                  isSelected: true,
                  no: '1',
                ),
                SizedBox(width: 24),
                CheckoutHeaderItem(
                  title: 'العنوان',
                  isSelected: true,
                  no: '2',
                ),
                SizedBox(width: 24),
                CheckoutHeaderItem(
                  title: 'الدفع',
                  isSelected: true,
                  no: '3',
                ),
                SizedBox(width: 24),
                CheckoutHeaderItem(
                  title: 'المراجعه',
                  isSelected: true,
                  no: '4',
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const Text('ملخص الطلب', style: TextStyles.bold13),
            const SizedBox(height: 8.0),
            const TRoundedContainer(
              backgroundColor: AppColors.checkoutItemBackground,
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 16.0),
              radius: 6.0,
              child: Column(
                children: [
                  TowTextAndSpaceBetween(
                    label: 'المجموع الفرعي',
                    value: '150 جنيه',
                    labelStyle: TextStyles.regular13,
                    valueStyle: TextStyles.semiBold16,
                  ),
                  SizedBox(height: 8.0),
                  TowTextAndSpaceBetween(
                    label: 'التوصيل',
                    value: '30 جنيه',
                    labelStyle: TextStyles.regular13,
                    valueStyle: TextStyles.semiBold13,
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Divider(),
                  ),
                  SizedBox(height: 8.0),
                  TowTextAndSpaceBetween(
                    label: 'الكلي',
                    value: '180 جنيه',
                    labelStyle: TextStyles.bold16,
                    valueStyle: TextStyles.bold16,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('يرجى تأكيد طلبك', style: TextStyles.bold13),
            const SizedBox(height: 8.0),
            TRoundedContainer(
              backgroundColor: AppColors.checkoutItemBackground,
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
              radius: 6.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('وسيلة الدفع', style: TextStyles.bold13),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.edit_2,
                            size: 16,
                            color: Color(0xFF6C7275),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            'تعديل',
                            style: TextStyles.semiBold13
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '6522 **** **** ****',
                        style: TextStyles.regular16.copyWith(
                          color: const Color(0xFF4E5556),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const CheckoutPaymentItem(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            TRoundedContainer(
              backgroundColor: AppColors.checkoutItemBackground,
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
              radius: 6.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('عنوان التوصيل', style: TextStyles.bold13),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.edit_2,
                            size: 16,
                            color: Color(0xFF6C7275),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            'تعديل',
                            style: TextStyles.semiBold13
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Iconsax.location,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'شارع النيل، مبنى رقم ١٢٣',
                        style: TextStyles.regular16.copyWith(
                          color: const Color(0xFF4E5556),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            CustomButton(
              onPressed: () {},
              text: 'تأكيد الطلب',
            )
          ],
        ),
      ),
    );
  }
}
