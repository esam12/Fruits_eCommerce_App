import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruits/core/services/fcm_service/data/repositories/fcm_service_impl.dart';
import 'package:fruits/core/services/fcm_service/domain/usecases/listen_to_fcm_messages.dart';

class FcmService {
  late final ListenToFcmMessages listenToFcmMessages;

  FcmService._internal();

  static final FcmService instance = FcmService._internal();

  void init() {
    final repository = FcmServiceImpl(FirebaseMessaging.instance);
    listenToFcmMessages = ListenToFcmMessages(repository);
  }
}