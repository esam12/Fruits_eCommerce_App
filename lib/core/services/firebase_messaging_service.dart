import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    // طلب الإذن للإشعارات (مطلوب للـ iOS)
    await _fcm.requestPermission();

    // الحصول على الـ token
    String? token = await _fcm.getToken();
    print("FCM Token: $token");

    // الاستماع للإشعارات أثناء تشغيل التطبيق
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("New notification: ${message.notification?.title}");
      // هون بتربطها مع Cubit/BLoC تبع الإشعارات إذا بدك
    });

    // الإشعارات اللي بتوصل والتطبيق بالخلفية
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification clicked!");
    });
  }
}