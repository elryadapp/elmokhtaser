import 'dart:io';

import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static AnimationController? controller;

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void startLottie() {
    controller!.forward();
    if (controller!.isCompleted) {
      controller!.stop();
    }
  }

 static AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', 'Hight Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high);
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      startLottie();
      AppUtil.flushbarNotification(message.data['body']);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: '@mipmap/ic_launcher')));
      } else if (notification != null && android == null && Platform.isIOS) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
                iOS: IOSNotificationDetails(
                    presentAlert: true,
                    presentBadge: true,
                    presentSound: true)));
      }
    });
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }
}
