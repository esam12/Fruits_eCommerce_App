import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        height: 24,
        width: 24,
        duration: const Duration(milliseconds: 200),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : AppColors.dividerColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(Assets.imagesCheck))
            : const SizedBox(),
      ),
    );
  }
}
