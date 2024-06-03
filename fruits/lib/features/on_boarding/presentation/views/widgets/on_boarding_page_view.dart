import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    int pageViewIndex = 0;
    return PageView(
      onPageChanged: (value) {
        print(value);
        pageViewIndex = value;
      },
      
      children: [
        
        PageViewItem(
          
            pageViewIndex: pageViewIndex,
            backgroundImage: Assets.imagesOnboardingBg1,
            image: Assets.imagesOnboardingImage1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("مرحبًا بك في"), Text(" Fruit"), Text("HUB")],
            ),
            subTitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية."),
        PageViewItem(
            pageViewIndex: pageViewIndex,
            backgroundImage: Assets.imagesOnboardingBg2,
            image: Assets.imagesOnboardingImage2,
            title: Text('ابحث وتسوق'),
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية")
      ],
      
    );
  }
}
