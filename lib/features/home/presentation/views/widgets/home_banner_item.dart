import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/home/presentation/views/widgets/home_banner_item_button.dart';
import 'package:svg_flutter/svg.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width - 32;
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              right: width * .4,
              top: 0,
              child: SvgPicture.asset(
                Assets.imagesOnboardingImage2,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: width * .5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      Assets.imagesHomeBannerBG,
                    ),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'عروض العيد',
                      style: TextStyles.regular13
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold19
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    const SizedBox(height: 10),
                    HomeBannerItemButton(onPressed: () {}),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
