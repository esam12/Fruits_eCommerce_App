import 'package:flutter/material.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/auth/presentation/views/login_view.dart';
import 'package:fruits/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(.5),
          ),
        ),
        const SizedBox(height: 28),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
                onPressed: () {
                  SharedPreferencesSingleton.setBool(
                      'isOnBoardingViewSeen', true);
                  Navigator.of(context)
                      .pushReplacementNamed(LoginView.routeName);
                },
                text: 'ابدأ الان'),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
