import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_steps_view_page.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const CheckoutSteps(),
          const SizedBox(height: 32),
          CheckoutStepsViewPage(pageController: pageController),
          CustomButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              text: 'التالي'),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
