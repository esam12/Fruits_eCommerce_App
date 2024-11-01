import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/core/widgets/appbar/notification_widget.dart';
import 'package:fruits/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'bestSellerView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold19,
        ),
        showBackArrow: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.md),
            child: NotificationWidget(),
          ),
        ],
      ),
      body: BestSellingViewBody(),
    );
  }
}
