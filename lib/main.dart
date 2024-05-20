import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'dart:io' show Platform;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  try {
    showNotification(message);
  } catch (ex) {
    ex.toString();
  }
}

void showNotification(RemoteMessage? message) async {
  try {
    await Firebase.initializeApp();
    FlutterLocalNotificationsPlugin? fltNotification;
    var androidInit =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInit = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    var initSetting =
    InitializationSettings(android: androidInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting);
    await fltNotification.cancelAll();
    if (message?.notification?.title != null &&
        message?.notification?.body != null) {
      var androidDetails = const AndroidNotificationDetails(
          'channelId', 'channelName',
          icon: "");
      var iosDetails = DarwinNotificationDetails(
        badgeNumber: 0,
        presentAlert: true,
        presentBadge: false,
        presentSound: true,
        subtitle: message?.notification?.title,
      );
      var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iosDetails);
      await fltNotification.show(0, '${message?.notification?.title}',
          message?.notification?.body, generalNotificationDetails,
          payload: 'Notification');
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("onMessageOpenedApp");
        Map<String, dynamic> value = {'id': 'ooosaaamaaa'};
        // _router.pushNamed('notificationPage',extra:value);
        scaffoldKey.currentState
            ?.pushNamed('notificationPage', arguments: value);
      });
    }
  } catch (ex) {
    ex.toString();
  }
}
final scaffoldKey = GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await initFirebase();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initPushNotifications();
  try {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyB7lF_SP39CPxUz5gnXoyuhd_5lwmKOqZY",
              appId: "1:700302944427:android:d11e2b2125b67313316fee",
              messagingSenderId: "700302944427",
              projectId: "com.dimondstrack.stracker"));
    } else {
      await Firebase.initializeApp();
    }
    await FirebaseMessaging.instance.requestPermission();
  } on FirebaseException {
    print('object');
  }


  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
}


class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'STracker',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
