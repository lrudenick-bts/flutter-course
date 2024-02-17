import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/config/local_notifications/local_notifications.dart';
import 'package:push_app/config/router/app_router.dart';
import 'package:push_app/config/theme/app_theme.dart';
import 'package:push_app/presentation/blocs/notification_bloc/notification_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await NotificationBloc.initializeFCM();
  await LocalNotifications.initializedLocalNotifications();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NotificationBloc(
        requestLocalNotificationPermissions: LocalNotifications.requestLocalNotificationPermissions,
        showLocalNotification: LocalNotifications.showLocalNotification
      ))
    ], 
    child: const MainApp()
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      builder: (context, child) => HandleNotificationInteraction(child: child!),
    );
  }
}

class HandleNotificationInteraction extends StatefulWidget {
  final Widget child;

  const HandleNotificationInteraction({super.key, required this.child});

  @override
  State<HandleNotificationInteraction> createState() => _HandleNotificationInteractionState();
}

class _HandleNotificationInteractionState extends State<HandleNotificationInteraction> {

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }
  
  void _handleMessage(RemoteMessage message) {
    context.read<NotificationBloc>().handleRemoteMessage(message);

    // TODO move this to a helper
    final messageId = message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '';
    appRouter.push('/message-details/$messageId');
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }



  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}