import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.isReaded,
  });

  final bool isReaded;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isReaded
          ? AppColors.notificationItemBackground
          : AppColors.whiteColor,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13.0,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (isReaded)
              Positioned(
                top: -4,
                right: 12,
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularImage(
                      image: 'assets/images/sale.png',
                      isNetworkImage: false,
                      imageHeight: 59,
                      imageWidth: 59,
                      backgroundColor: isReaded
                          ? AppColors.notificationItemBackground
                          : AppColors.whiteColor,
                    ),
                    const SizedBox(width: 13.0),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: const Text(
                        'خصم 50% علي اسعار الفواكه بمناسبه العيد',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.semiBold13,
                      ),
                    ),
                  ],
                ),
                Text(
                  '9 صباحا',
                  style: TextStyles.regular13
                      .copyWith(color: AppColors.greyTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeaderInNotificationView extends StatelessWidget {
  const SectionHeaderInNotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('جديد', style: TextStyles.bold16),
            const SizedBox(width: 6.0),
            Container(
              width: 22.0,
              height: 22.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.gridColor),
              child: Text(
                '3',
                textAlign: TextAlign.center,
                style: TextStyles.bold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        Text(
          'تحديد الكل مقروء',
          style: TextStyles.regular13.copyWith(
            color: AppColors.greyTextColor,
          ),
        )
      ],
    );
  }
}
