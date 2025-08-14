import 'package:fruits/core/services/fcm_service/domain/entities/fcm_message.dart';

abstract class FcmRepository {
  Stream<FcmMessage> listenToMessages();
  Future<void> requestPermission();
  Future<String?> getToken();
}