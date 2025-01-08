import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = 'checkoutView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CheckoutViewBody(),
      appBar: buildAppBar(context, title: 'الشحن'),
    );
  }
}
