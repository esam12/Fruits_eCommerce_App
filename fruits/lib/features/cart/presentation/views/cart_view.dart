import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'السلة',
          style: TextStyles.bold19,
        ),
        showBackArrow: true,
      ),
      body: CartViewBody(),
    );
  }
}
