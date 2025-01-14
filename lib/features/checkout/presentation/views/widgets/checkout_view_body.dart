import 'package:flutter/material.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_steps_view_page.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
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
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          const SizedBox(height: 32),
          CheckoutStepsViewPage(pageController: pageController),
          CustomButton(
              onPressed: () {
                if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(
                    currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else {
                  FLoaders.warningSnackBar(
                      context: context, title: 'يرجى تحديد طريقة الدفع');
                }
              },
              text: _buildButtonText(currentPageIndex)),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // build button text based on current page index.
  String _buildButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }
}
