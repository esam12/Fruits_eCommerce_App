import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_review_view_body.dart';

class CheckoutReviewView extends StatelessWidget {
  const CheckoutReviewView({super.key});

  static const String routeName = 'checkoutReviewView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'المراجعة',
          style: TextStyles.bold19,
        ),
      ),
      body: CheckoutReviewViewBody(),
    );
  }
}