import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsViewPage extends StatelessWidget {
  const CheckoutStepsViewPage(
      {super.key,
      required this.pageController,
      required this.formKey,
      required this.valueListenable});
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

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
      AddressInputSection(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
      const PaymentSection(),
    ];
  }
}
