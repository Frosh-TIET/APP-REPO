import 'package:firebase_messaging/firebase_messaging.dart';
Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}
class FirebaseApi{
  final _firebaseMessaging=FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fMCToken=await _firebaseMessaging.getToken();
    print('Token: $fMCToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');
//
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Got a message whilst in the foreground!');
//       print('Message data: ${message.data}');
//
//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });
//
//     FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
//       if (message != null) {
//         print('App opened from terminated state: ${message.data}');
//       }
//     });
//   }
// }