import 'package:flutter/material.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late AuthRepo authRepo;
  late FirebaseAuthService authService;
  @override
  void initState() {
    authRepo = getIt<AuthRepo>();
    authService = getIt<FirebaseAuthService>();
    excuteNav(context);
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

  void excuteNav(context) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (authService.isLoggedIn()) {
          final uid = authService.authUser!.uid;
          final userEntity = await authRepo.getUserData(uid: uid);
          await authRepo.saveUserData(user: userEntity);
        }
        authService.screenRedirect(context);
      },
    );
  }
}
