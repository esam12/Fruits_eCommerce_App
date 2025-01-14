import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesLocation,
          ),
          const SizedBox(
            width: Sizes.sm,
          ),
          Text(
            context.read<OrderEntity>().shippingAddress.getAddress(),
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                pageController.page!.toInt() - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesEdit,
                  ),
                  const SizedBox(
                    width: Sizes.xs,
                  ),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
