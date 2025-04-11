import 'dart:convert';

import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCMHelper {
  static final shared = FCMHelper();
  late FlutterLocalNotificationsPlugin fltNotification;

  intializeFirebase() async {
    Firebase.initializeApp().then((value) {
      requestPermission();
      getToken();
      initMessaging();
    });
  }

  void initMessaging() {
    var androiInit = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();

    fltNotification.initialize(
      initSetting,
      // onDidReceiveNotificationResponse: (details) {},
      // onDidReceiveBackgroundNotificationResponse: (details) {
      //   print("fltNotification details $details");
      // },

      onDidReceiveNotificationResponse: (details) {
        print("details.payload here ${details.payload}");
        final payload = details.payload;
        final data = json.decode(payload!);
        //  print("data notification : ${data['nid']}");
        //if (data != "" || data != nul1112l) {
        // var notificationtype = data["ntype"];
        // print("notificationtype here $notificationtype");
        // var nid = data["nid"];
        //final controller = NotificationController();
        //   final albumDetailController = BaseController();
        // SharedPref.shared.pref
        //     ?.setString(PrefKeys.isComingFromNotification, "1");
        // SharedPref.shared.pref
        //     ?.setString(PrefKeys.notificationType, notificationtype);
        // SharedPref.shared.pref?.setString(PrefKeys.notId, nid);

        // Get.to(NotificationScreen());
      },
    );

    var androidDetails = const AndroidNotificationDetails(
      "1",
      "ALPHA E-COMMERCE",
      icon: "@mipmap/ic_launcher",
      playSound: true,
    );
    var iosDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails,
            payload: json.encode(message.data));
      }
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      getToken();
    }
    print('User granted permission: ${settings.authorizationStatus}');
  }

  void getToken() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("FCM token is $value");
      if (value?.isNotEmpty ?? false) {
        SharedPref.shared.pref?.setString("FCMToken", value!);
      }
    });
  }

  void listenNotificationInForground() {
    print('Message also contained a notification:');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Future<void> listenNotificationInBackground(RemoteMessage message) async {
    // Firebase.initializeApp();
    print("Handling a background message: ${message.data}");
  }
}
