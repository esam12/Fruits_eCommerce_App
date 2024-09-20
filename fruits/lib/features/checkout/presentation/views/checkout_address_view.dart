import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_address_view_body.dart';

class CheckoutAddressView extends StatelessWidget {
  const CheckoutAddressView({super.key});

  static const routeName = 'checkoutAddressView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'العنوان',
          style: TextStyles.bold19,
        ),
      ),
      body: CheckoutAddressViewBody(),
    );
  }
}
