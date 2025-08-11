import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingSteps extends StatelessWidget {
  final String status;

  const TrackingSteps({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 'Cancelled') {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'تم إلغاء الطلب',
            style: TextStyles.bold16.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    // Define the tracking steps and their order
    final List<Map<String, String>> steps = [
      {'text': 'تتبع الطلب', 'status': 'Pending', 'date': '22 مارس, 2024'},
      {'text': 'قبول الطلب', 'status': 'Accepted', 'date': '22 مارس, 2024'},
      {'text': 'تم شحن الطلب', 'status': 'Shipped', 'date': '22 مارس, 2024'},
      {'text': 'قيد الانتظار', 'status': 'Cancelled', 'date': 'قيد الانتظار'},
      {'text': 'تم التسليم', 'status': 'Delivered', 'date': 'تم التسليم'},
    ];

    // Get the index of the current status
    final currentStatusIndex =
        steps.indexWhere((step) => step['status'] == status);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          itemBuilder: (context, index) {
            final step = steps[index];
            final isCompleted = index <= currentStatusIndex;

            return TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: index == 0,
              isLast: index == steps.length - 1,
              endChild: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      step['text']!,
                      style: isCompleted
                          ? TextStyles.regular13
                              .copyWith(color: AppColors.primaryColor)
                          : TextStyles.regular13
                              .copyWith(color: AppColors.greyTextColor),
                    ),
                    const Spacer(),
                    Text(
                      step['date']!,
                      style: isCompleted
                          ? TextStyles.regular13
                              .copyWith(color: AppColors.primaryColor)
                          : TextStyles.regular13
                              .copyWith(color: AppColors.greyTextColor),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              startChild:
                  Container(), // The startChild is empty to push the timeline to the right
              indicatorStyle: IndicatorStyle(
                width: 16,
                color: isCompleted
                    ? AppColors.primaryColor
                    : AppColors.greyTextColor,
                indicator: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? AppColors.primaryColor
                        : AppColors.greyTextColor,
                  ),
                ),
              ),
              afterLineStyle: LineStyle(
                color: isCompleted
                    ? AppColors.primaryColor
                    : AppColors.greyTextColor,
                thickness: 2,
              ),
              beforeLineStyle: LineStyle(
                color: isCompleted
                    ? AppColors.primaryColor
                    : AppColors.greyTextColor,
                thickness: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
