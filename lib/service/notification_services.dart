import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    // Request permissions for iOS
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User denied or not granted permission');
    }
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // Get the device token
    String? token = await _messaging.getToken();
    print('FCM Token: $token');

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(
          title: message.notification!.title,
          body: message.notification!.body,
        );
      }
      print('Message received: ${message.notification?.title}');
    });

    // Listen for background messages
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification opened: ${message.notification?.title}');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message: ${message.notification?.title}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification opened: ${message.notification?.title}');
    });
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    print('Background message received: ${message.notification?.title}');
  }

  void showNotification({String? title, String? body}) {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'foreground_channel', // Channel ID
      'Foreground Notifications', // Channel name
      channelDescription: 'This channel is used for foreground notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      notificationDetails,
    );
  }
}
