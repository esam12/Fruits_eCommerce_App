import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/circular_container.dart';
import 'package:fruits/core/widgets/containers/rounded_container.dart';
import 'package:svg_flutter/svg.dart';
import 'package:timelines/timelines.dart';

class OrderTrackingViewBody extends StatelessWidget {
  const OrderTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TRoundedContainer(
              backgroundColor:
                  AppColors.checkoutItemBackground.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              child: Row(
                children: [
                  TCircularContainer(
                    width: 66,
                    height: 66,
                    padding: 16.0,
                    backgroundColor: AppColors.notificationItemBackground,
                    child: SvgPicture.asset(
                      'assets/images/order_tracking_1.svg',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'رقم الطلب: #123456',
                        style: TextStyles.bold13,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'تم الطلب :22 مارس ,2024',
                        style: TextStyles.regular11.copyWith(
                          color: AppColors.greyTextColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'عدد الطلبات : ',
                              style: TextStyles.regular11.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                            const TextSpan(
                              text: '10',
                              style: TextStyles.bold13,
                            ),
                            const TextSpan(text: '   '),
                            const TextSpan(
                                text: '250 جنية', style: TextStyles.bold13),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            TRoundedContainer(
              backgroundColor:
                  AppColors.checkoutItemBackground.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              child: FixedTimeline(
                theme: TimelineThemeData(
                  nodePosition: 0,
                  connectorTheme: const ConnectorThemeData(
                    thickness: 0.5,
                    color: AppColors.primaryColor,
                  ),
                ),
                children: [
                  _buildTimelineTile(
                    'تتبع الطلب',
                    'assets/images/order_tracking_2.svg',
                    'ok',
                  ),
                  _buildTimelineTile(
                    'قبول الطلب',
                    'assets/images/order_tracking_3.svg',
                    'ok',
                  ),
                  _buildTimelineTile(
                    'تم شحن الطلب',
                    'assets/images/order_tracking_4.svg',
                    'ok',
                  ),
                  _buildTimelineTile(
                    'خرج للتوصيل',
                    'assets/images/order_tracking_5.svg',
                    'not',
                  ),
                  _buildTimelineTile(
                    'تم تسليم',
                    'assets/images/order_tracking_6.svg',
                    'not',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TimelineTile _buildTimelineTile(
    String status, String assetPath, String statusSetting) {
  return TimelineTile(
    nodeAlign: TimelineNodeAlign.start,
    contents: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: TextStyles.bold13,
          ),
          const SizedBox(height: 2),
          Text(
            '22 مارس , 2024',
            style:
                TextStyles.semiBold13.copyWith(color: AppColors.greyTextColor),
          ),
        ],
      ),
    ),
    node: TimelineNode(
      indicator: DotIndicator(
        child: TCircularContainer(
          width: 66,
          height: 66,
          padding: 16.0,
          radius: 100,
          backgroundColor: AppColors.notificationItemBackground,
          child: SvgPicture.asset(
            assetPath,
            width: 42,
            colorFilter: ColorFilter.mode(
                statusSetting == 'ok'
                    ? AppColors.primaryColor
                    : const Color(0xFF868889),
                BlendMode.srcIn),
          ),
        ),
      ),
      startConnector: const SolidLineConnector(),
      endConnector: const SolidLineConnector(),
    ),
  );
}
