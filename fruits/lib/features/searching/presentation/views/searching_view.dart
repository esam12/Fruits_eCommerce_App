import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/searching/presentation/views/widgets/searching_view_body.dart';

class SearchingView extends StatelessWidget {
  const SearchingView({super.key});

  static const routeName = 'searching';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'البحث',
          style: TextStyles.bold19,
        ),
        showBackArrow: true,
        actions: [
          Image.asset(
            "assets/images/notif.png",
            width: 35,
            height: 35,
          ),
        ],
      ),
      body: const SearchingViewBody(),
    );
  }
}
