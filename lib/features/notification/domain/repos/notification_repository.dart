import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/features/notification/domain/entity/notification_entity.dart';

abstract class NotificationRepository {
  
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
}