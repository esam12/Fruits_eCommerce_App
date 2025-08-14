import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/features/notification/domain/repos/notification_repository.dart';
import 'package:fruits/features/notification/presentation/manager/notification/notification_cubit.dart';
import 'package:fruits/features/notification/presentation/views/widgets/notification_item.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationCubit(getIt.get<NotificationRepository>())
            ..getNotifications(userId: FirebaseAuthService().authUser!.uid),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              const SectionHeaderInNotificationView(),
              const SizedBox(height: 16.0),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is NotificationLoaded) {
                    if (state.notifications.isEmpty) {
                      return const Center(
                        child: Text('لا يوجد اشعارات'),
                      );
                    }
                    return SizedBox(
                      height: 200.0,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8.0),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return const NotificationItem(isReaded: true);
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
