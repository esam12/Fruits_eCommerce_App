import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruits/core/services/fcm_service/data/models/fcm_message_model.dart';
import 'package:fruits/core/services/fcm_service/domain/entities/fcm_message.dart';
import 'package:fruits/core/services/fcm_service/domain/repositories/fcm_repository.dart';

class FcmServiceImpl implements FcmRepository {
  final FirebaseMessaging _messaging;

  FcmServiceImpl(this._messaging);

  @override
  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  @override
  Stream<FcmMessage> listenToMessages() {
    return FirebaseMessaging.onMessage.map((message) {
      return FcmMessageModel.fromRemoteMessage(message);
    });
  }

  @override
  Future<void> requestPermission() async {
    await _messaging.requestPermission();
  }
}