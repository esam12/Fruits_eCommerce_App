import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruits/core/services/fcm_service/domain/entities/fcm_message.dart';

class FcmMessageModel extends FcmMessage {
  const FcmMessageModel({
    required super.title,
    required super.body,
    required super.data,
  });

  factory FcmMessageModel.fromRemoteMessage(RemoteMessage message) {
    return FcmMessageModel(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      data: message.data,
    );
  }
}