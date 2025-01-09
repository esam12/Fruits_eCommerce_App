import 'package:flutter/material.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsViewPage extends StatelessWidget {
  const CheckoutStepsViewPage({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: getPages().length,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      const AddressInputSection(),
      const SizedBox(),
      const SizedBox(),
    ];
  }
}
