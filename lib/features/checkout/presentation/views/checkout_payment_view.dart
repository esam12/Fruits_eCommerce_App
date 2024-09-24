import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_payment_view_body.dart';

class CheckoutPaymentView extends StatelessWidget {
  const CheckoutPaymentView({super.key});

  static const String routeName = 'checkoutPaymentView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'الدفع',
          style: TextStyles.bold19,
        ),
      ),
      body: CheckoutPaymentViewBody(),
    );
  }
}