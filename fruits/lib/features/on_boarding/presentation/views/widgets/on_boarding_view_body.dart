import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key, this.pageViewIndex = 0});
  final int pageViewIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: OnBoardingPageView(),
        ),
        SmoothPageIndicator(
          controller: PageController(), // PageController
          count: 2,
          effect: WormEffect(
              dotColor: AppColors.lightGreen.withOpacity(0.5),
              activeDotColor: AppColors.primaryColor), // your preferred effect
          onDotClicked: (index) {},
        )
      ],
    );
  }
}
