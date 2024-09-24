import 'package:flutter/material.dart';
import 'package:fruits/core/helper/functions/helper_functions.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.backgroundColor = AppColors.whiteColor});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: showBackArrow
          ? IconButton.outlined(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                shape: const CircleBorder(
                  side: BorderSide(color: AppColors.iconBorderColor),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: dark ? AppColors.whiteColor : AppColors.blackButtonColor,
              ),
            )
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
              : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
