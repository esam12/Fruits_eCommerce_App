import 'package:flutter/material.dart';
import 'package:fruits/core/helper/functions/get_user.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          const SizedBox(width: 11),
          Column(
            children: [
              Text(
                "صباح الخير !..",
                style: TextStyles.regular16
                    .copyWith(color: AppColors.greyTextColor),
              ),
              const SizedBox(height: 5),
              Text(
                getUser().name,
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
      actions: [
        Image.asset(
          "assets/images/notif.png",
          width: 35,
          height: 35,
        ),
      ],
    );
  }
}
