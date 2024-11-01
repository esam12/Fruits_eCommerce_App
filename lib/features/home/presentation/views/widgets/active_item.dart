import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.only(left: 16.0),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: 35,
              height: 35,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: AppColors.primaryColor,
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(width: 4),
            Text(
              name,
              style:
                  TextStyles.semiBold11.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
