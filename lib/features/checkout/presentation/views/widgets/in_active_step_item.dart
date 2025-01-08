import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.title, required this.index});

  final String index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.checkoutItemBackground,
          radius: 10,
          child: Text(
            index,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13,
          ),
        ),
        const SizedBox(width: 4.0),

        // Title
        Text(
          title,
          style: TextStyles.bold13.copyWith(
            color: AppColors.checkoutTextItemColor,
          ),
        ),
      ],
    );
  }
}
