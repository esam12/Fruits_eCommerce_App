import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: Sizes.lg),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40.0',
        ),
        SizedBox(height: Sizes.spaceBtwItems),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجى تحديد طريقة الدفع',
          price: '40.0',
        ),
      ],
    );
  }
}
