import 'package:fruits/core/services/fcm_service/domain/entities/fcm_message.dart';
import 'package:fruits/core/services/fcm_service/domain/repositories/fcm_repository.dart';

class ListenToFcmMessages {
  final FcmRepository repository;

  ListenToFcmMessages(this.repository);

  Stream<FcmMessage> call() {
    return repository.listenToMessages();
  }
}