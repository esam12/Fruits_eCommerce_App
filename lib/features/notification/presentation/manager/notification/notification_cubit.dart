import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits/features/notification/domain/entity/notification_entity.dart';
import 'package:fruits/features/notification/domain/repos/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationCubit(this.notificationRepository) : super(NotificationInitial());

  Future<void> getNotifications(
      {required String userId}) async {
    emit(NotificationLoading());
    var result = await notificationRepository.getNotifications();
    result.fold((l) => emit(NotificationError(message: l.message)),
        (r) => emit(NotificationLoaded(notifications: r)));
  }
}
