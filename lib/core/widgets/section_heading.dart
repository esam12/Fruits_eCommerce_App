import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "المزيد",
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.bold16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        showActionButton
            ? TextButton(
                onPressed: onPressed,
                child: Text(buttonTitle,style: TextStyles.regular13.copyWith(color: AppColors.greyTextColor),),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
