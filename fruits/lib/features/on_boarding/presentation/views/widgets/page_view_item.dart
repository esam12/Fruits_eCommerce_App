import 'package:flutter/material.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/auth/presentation/views/login_view.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.isVisible,
  });

  final String backgroundImage;
  final String image;
  final Widget title;
  final String subTitle;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      SharedPreferencesSingleton.setBool(
                          'isOnBoardingViewSeen', true);
                      Navigator.of(context)
                          .pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text(
                      "تخط",
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Column(
            children: [
              title,
              const SizedBox(height: 24),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF4E5456),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
