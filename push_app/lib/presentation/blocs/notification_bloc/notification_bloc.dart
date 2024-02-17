import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:push_app/config/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notification_event.dart';
part 'notification_state.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final Future<void> Function()? requestLocalNotificationPermissions;
  final void Function({
    required int id,
    String? title,
    String? body,
    String? data
  })? showLocalNotification;
  
  NotificationBloc({
    this.requestLocalNotificationPermissions,
    this.showLocalNotification
  }) : super(const NotificationState()) {
    on<NotificationStatusChanged>(_notificationStatusChanged);

    on<NotificationReceived>(_onPushMessageReceived);

    // Verify permission status
    _initialStatusCheck();

    // Initialize foreground notification listener
    _onForegroundMessage();
  }

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged(
    NotificationStatusChanged event, 
    Emitter<NotificationState> emit
  ) {
    emit(
      state.copyWith(
        status: event.status
      )
    );
  }

  void _onPushMessageReceived(
    NotificationReceived event, 
    Emitter<NotificationState> emit
  ) {
    emit(
      state.copyWith(
        notifications: [event.message, ...state.notifications]
      )
    );
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
    _getFCMToken();
  }

  void _getFCMToken() async {
    final settings = await messaging.getNotificationSettings();
    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await messaging.getToken();
      print(token);
    }
  }

  void handleRemoteMessage(RemoteMessage message) {
    if(message.notification == null) return;

    if (message.notification != null) {
      final remoteNotification = message.notification!;
      final notification = PushMessage(
        title: remoteNotification.title ?? '', 
        messageId: message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '', 
        body: remoteNotification.body?? '', 
        sentDate: message.sentTime?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid
          ? message.notification?.android?.imageUrl 
          : null
      );

      print(notification);

      if(showLocalNotification != null) {
        showLocalNotification!(
          id: DateTime.now().hashCode,
          title: notification.title,
          body: notification.body,
          data: notification.messageId
        );
      }

      add(NotificationReceived(notification));
    }
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    // Request permissions for local notifications
    if(requestLocalNotificationPermissions != null) {
      await requestLocalNotificationPermissions!();
    }

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  PushMessage? getMessageById(String messageId) {
    final exists = state.notifications.any((message) {
      return message.messageId == messageId;
    });

    if(!exists) return null;

   return state.notifications.firstWhere((message) =>
      message.messageId == messageId
    );
  }
}
