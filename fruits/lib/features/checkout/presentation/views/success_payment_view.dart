import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/success_payment_view_body.dart';

class SuccessPaymentView extends StatelessWidget {
  const SuccessPaymentView({super.key});

  static const routeName = 'successPaymentView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('الدفع'),
      ),
      body: SuccessPaymentViewBody(),
    );
  }
}
