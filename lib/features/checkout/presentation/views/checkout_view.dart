import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = 'checkoutView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckoutViewBody(),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'الشحن',
          style: TextStyles.bold19,
        ),
      ),
    );
  }
}
