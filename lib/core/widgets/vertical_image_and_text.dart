import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.whiteColor,
    this.backgroundColor = AppColors.whiteColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          /// Image
          CircularImage(
            image: image,
            boxFit: BoxFit.fitWidth,
            isNetworkImage: isNetworkImage,
            backgroundColor: backgroundColor,
          ),
          const SizedBox(height: 4),

          /// Text
          SizedBox(
            width: 60,
            child: Text(
              title,
              style: TextStyles.semiBold13.copyWith(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
