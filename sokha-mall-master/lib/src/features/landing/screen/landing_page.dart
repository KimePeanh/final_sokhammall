import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/app/screens/app_page.dart';
import 'package:sokha_mall/src/features/authentication/bloc/authentication_bloc.dart';
import 'package:sokha_mall/src/features/authentication/bloc/index.dart';
import 'package:sokha_mall/src/features/notification/bloc/index.dart';
import 'package:sokha_mall/src/features/splash/screens/splash_page.dart';
import 'package:sokha_mall/src/utils/services/notification_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // FlutterAppBadger.updateBadgeCount(1);
    notificationNavigator(context,
        target: message.data["target"],
        targetValue: message.data["target_value"]);
    print("Handling a   message");
  }

  initNotification() async {
    Firebase.initializeApp().then((value) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging.requestPermission();
      messaging.subscribeToTopic("all").then((value) {
        messaging
            .setForegroundNotificationPresentationOptions(
                alert: true, badge: true, sound: true)
            .then((value) {
          String? token;

          messaging.getToken().then((value) {
            token = value;
            print("token" + token.toString());
            FirebaseMessaging.instance.getInitialMessage().then((message) {
              print("FirebaseMessaging.getInitialMessage");
              if (message != null) {
                print(message);
                notificationNavigator(context,
                    target: message.data["target"],
                    targetValue: message.data["target_value"]);
              }
            });
            FirebaseMessaging.onBackgroundMessage(
                firebaseMessagingBackgroundHandler);
            FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
              log(message.toString());
              BlocProvider.of<NotificationBloc>(context)
                  .add(SetReadingStatus(isRead: false));
            });

            FirebaseMessaging.onMessageOpenedApp
                .listen(firebaseMessagingBackgroundHandler);
          });
        });
      });
    });
  }

  @override
  void initState() {
    initNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      print(state);
      if (state is Initializing) {
        return SplashPage();
      }
      return AppPage();
    });
  }
}
