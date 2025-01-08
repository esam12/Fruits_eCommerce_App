import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_listtile_item.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            const CheckoutSteps(),
            const SizedBox(height: 32),
            const CheckoutListTileItem(
              title: 'الدفع عند الاستلام',
              suTitle: 'التسليم من المكان',
              totalPrice: '40 جنيه',
              isSelected: false,
            ),
            const SizedBox(height: 8.0),
            const CheckoutListTileItem(
              title: 'اشتري الان وادفع لاحقا',
              suTitle: 'يرجى تحديد طريقة الدفع',
              totalPrice: 'مجاني',
              isSelected: true,
            ),
            const SizedBox(height: 100),
            CustomButton(onPressed: () {}, text: 'التالي')
          ],
        ),
      ),
    );
  }
}
