import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            isVisible: true,
            backgroundImage: Assets.imagesOnboardingBg1,
            image: Assets.imagesOnboardingImage1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "مرحبًا بك في",
                  style: TextStyles.bold23,
                ),
                Text(
                  " HUB",
                  style: TextStyles.bold23
                      .copyWith(color: AppColors.secondaryColor),
                ),
                Text(
                  " Fruit",
                  style:
                      TextStyles.bold23.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            subTitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية."),
        const PageViewItem(
            isVisible: false,
            backgroundImage: Assets.imagesOnboardingBg2,
            image: Assets.imagesOnboardingImage2,
            title: Text('ابحث وتسوق', style: TextStyles.bold23),
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية")
      ],
    );
  }
}
