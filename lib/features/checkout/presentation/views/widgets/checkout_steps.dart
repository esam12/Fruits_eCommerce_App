import 'package:flutter/material.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:provider/provider.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                );
              } else {
                FLoaders.warningSnackBar(
                    context: context, title: 'يرجى تحديد طريقة الدفع');
              }
            },
            child: StepItem(
              title: getSteps()[index],
              index: (index + 1).toString(),
              isSelected: index <= currentPageIndex,
            ),
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
