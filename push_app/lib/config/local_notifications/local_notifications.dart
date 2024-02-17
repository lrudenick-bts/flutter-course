import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_app/config/router/app_router.dart';

class LocalNotifications {
  static Future<void> requestLocalNotificationPermissions() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> initializedLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    // TODO ios configuration

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid
      // TODO ios configuration settings
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  static void onDidReceiveNotificationResponse(NotificationResponse response) {
    appRouter.push('/message-details/${response.payload?? ''}');
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data
  }) {
    const androidDetails = AndroidNotificationDetails(
      'channel_id', 
      'channel_name',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails
      // TODO ios
    );

    final localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    localNotificationsPlugin.show(id, title, body, notificationDetails, payload: data);
  }
}