import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/data_service.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';
import 'package:fruits/features/notification/data/model/notification_model.dart';
import 'package:fruits/features/notification/domain/entity/notification_entity.dart';
import 'package:fruits/features/notification/domain/repos/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final DatabaseService databaseService;

  NotificationRepositoryImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection(BackendEndpoint.getNotifications)
          .doc();
      final docId = docRef.id;
      var data = await databaseService.getData(
          path: BackendEndpoint.getNotifications, documentId: docId);
      if (data == null) return right([]);
      final List<Map<String, dynamic>> notifications =
          List<Map<String, dynamic>>.from(data);
      return right(notifications
          .map((e) => NotificationModel.fromJson(e).toEntity())
          .toList());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
