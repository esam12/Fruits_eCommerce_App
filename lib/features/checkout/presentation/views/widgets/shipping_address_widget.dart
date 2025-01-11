import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

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
            ' المدينة - المنطقة - الحي - المنزل',
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          SizedBox(
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
          )
        ],
      ),
    );
  }
}
