import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/best_seller_view_body.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  static const routeName = 'bestSellerView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'الأكثر مبيعًا',
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
      body: const BestSellerViewBody(),
    );
  }
}
