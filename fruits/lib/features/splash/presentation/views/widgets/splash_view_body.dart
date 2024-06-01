import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.imagesPlantSplash),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogoSplash),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNav() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      },
    );
  }
}
