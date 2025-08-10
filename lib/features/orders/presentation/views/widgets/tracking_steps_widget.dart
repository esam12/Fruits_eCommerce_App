import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class TrackingSteps extends StatelessWidget {
  final String status;

  const TrackingSteps({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // Define the tracking steps and their order
    const steps = [
      'Pending',
      'Accepted',
      'Shipped',
      'Cancelled',
      'Delivered',
    ];

    // Get the index of the current status
    final currentStatusIndex = steps.indexOf(status);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: steps.map((step) {
          final stepIndex = steps.indexOf(step);
          final isCompleted = stepIndex <= currentStatusIndex;
          final isLastStep = stepIndex == steps.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Step text
              Expanded(
                child: Text(
                  step,
                  style: isCompleted
                      ? TextStyles.regular13
                          .copyWith(color: AppColors.primaryColor)
                      : TextStyles.regular13
                          .copyWith(color: AppColors.greyTextColor),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(width: 16),
              // Step icon and line
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon for the step
                  Icon(
                    isCompleted ? Icons.check_circle : Icons.circle,
                    color: isCompleted
                        ? AppColors.primaryColor
                        : AppColors.greyTextColor,
                    size: 16,
                  ),
                  // Vertical line connecting the steps
                  if (!isLastStep)
                    Container(
                      width: 2,
                      height: 40,
                      color: isCompleted
                          ? AppColors.lightPrimaryColor
                          : AppColors.greyTextColor,
                    ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
