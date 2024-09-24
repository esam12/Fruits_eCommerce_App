import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.dividerColor,
          ),
        ),
        SizedBox(width: 18.0),
        Text(
          'أو',
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16,
        ),
        SizedBox(width: 18.0),
        Expanded(
          child: Divider(
            color: AppColors.dividerColor,
          ),
        ),
      ],
    );
  }
}
