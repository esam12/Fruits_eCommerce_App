import 'package:flutter/material.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: StepItem(
            title: getSteps()[index],
            index: (index + 1).toString(),
            isSelected: true,
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
