import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class PrimeryHeaderContainer extends StatelessWidget {
  const PrimeryHeaderContainer({
    super.key,
    this.onTap, required this.appBar,
  });
  final void Function()? onTap;
  final Widget appBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar,
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackButtonColor.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 10,
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.primaryColor),
                  const SizedBox(width: 10.0),
                  Text(
                    " ابحث عن......",
                    style: TextStyles.regular13
                        .copyWith(color: AppColors.greyTextColor),
                  ),
                  const Spacer(),
                  const Icon(Icons.filter_list, color: AppColors.greyTextColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
