import 'package:flutter/material.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex, required this.pageController});

  final int currentPageIndex;
  final PageController pageController;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
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
