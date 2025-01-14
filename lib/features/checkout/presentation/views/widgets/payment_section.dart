import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Sizes.lg),
          const OrderSummaryWidget(),
          const SizedBox(height: Sizes.spaceBtwSections),
          ShippingAddressWidget(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
