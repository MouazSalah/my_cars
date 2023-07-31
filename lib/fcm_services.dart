import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAPi {
  final fcm = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await fcm.requestPermission();

    // final fcmtoken = await fcm.getToken();
    //  print("token = $fcmtoken");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // print('Handling a foreground message: ${message.messageId}');
      // print('Message data: ${message.data}');
      // print('Message notification: ${message.notification?.title}');
      // print('Message notification: ${message.notification?.body}');
    });
  }
}
