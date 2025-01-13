import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkoutView';

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: OrderEntity(cartEntity: cartEntity),
        child: const CheckoutViewBody(),
      ),
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
    );
  }
}
