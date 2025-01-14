import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Sizes.lg),
          OrderSummaryWidget(),
          SizedBox(height: Sizes.spaceBtwSections),
          ShippingAddressWidget(),
        ],
      ),
    );
  }
}
