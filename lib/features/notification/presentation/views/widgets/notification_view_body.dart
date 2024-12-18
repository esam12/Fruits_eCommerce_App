import 'package:flutter/material.dart';
import 'package:fruits/features/notification/presentation/views/widgets/notification_item.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeaderInNotificationView(),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 200.0,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const NotificationItem(isReaded: true);
              },
            ),
          )
        ],
      ),
    );
  }
}
