import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';

class CheckoutPaymentItem extends StatelessWidget {
  const CheckoutPaymentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(13.0),
      radius: 8.0,
      child: Image.asset(
        'assets/images/Mastercard.png',
        width: 38,
      ),
    );
  }
}
