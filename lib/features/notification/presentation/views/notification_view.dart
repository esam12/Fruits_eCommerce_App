import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/features/notification/presentation/views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static const String routeName = 'notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('الاشعارات', style: TextStyles.bold19),
        showBackArrow: true,
        actions: [
          Image.asset(
            'assets/images/notif.png',
            width: 35,
            height: 35,
          ),
        ],
      ),
      body: const NotificationViewBody(),
    );
  }
}
