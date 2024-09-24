import 'package:flutter/material.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
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
          mainAxisAlignment: MainAxisAlignment.end,
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
        FirebaseAuthService().screenRedirect(context);
      },
    );
  }
}
