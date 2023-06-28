import 'dart:convert';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:screen_mirroring_app/Notification%20Service/notificationservice.dart';
import 'package:screen_mirroring_app/Select%20Video%20Screen/Select%20Video%20Screen.dart';
import 'package:screen_mirroring_app/Splash%20Screens/Splash%20Screen%201.dart';
import 'package:screen_mirroring_app/main.dart';

import '../Appopen AD/AppOpen AD.dart';
import '../Splash Screens/Main Screen.dart';

class AppController extends GetxController with WidgetsBindingObserver {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  bool isPaused = false;
  bool isLoaded = false;
  TextEditingController Notification_title = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Notification_descrp = TextEditingController();

  @override
  Future<void> onInit() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // color: Colors.blue,
              playSound: true,
              icon: "@drawable/icon_notification",
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("A new onMessageOpenedApp event was published!");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        // showDialog(
        //     context: context,
        //     builder: (_) {
        //       return AlertDialog(
        //         title: Text(notification.title.toString()),
        //         content: SingleChildScrollView(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(notification.body.toString()),
        //             ],
        //           ),
        //         ),
        //       );
        //     });
      }
    });

    // TODO: implement onInit
    super.onInit();

    FacebookAudienceNetwork.init();
    WidgetsBinding.instance.addObserver(this);
    print('config.value -> ${remoteconfig.value}');
    // appOpenAdManager.loadAd();
    Future.delayed(const Duration(seconds: 3), () {
      remoteconfig.value != {}
          ? Get.off(() => SplashScreen1())
          : initConfig().whenComplete(() {
              remoteconfig.value =
                  json.decode(remoteConfig.getString('Mirroring'));
              print('__remoteConfig 22-> ${remoteconfig.value}');
            });
    });
    print('config.value 22 -> ${remoteconfig.value == null}');
  }

  // TODO: implement onStart
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      AppOpenAd.load(
        adUnitId: remoteconfig.value["AppOpen"],
        // adUnitId: "/6499/example/app-open",
        orientation: AppOpenAd.orientationPortrait,
        request: const AdManagerAdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            print("Ad Loaded.................................");
            appOpenAd = ad;
            isLoaded = true;
          },
          onAdFailedToLoad: (error) {
            print("Ad Loaded.................................");
            // Handle the error.
          },
        ),
      );
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed) {
      if (isLoaded == true) {
        appOpenAd?.show();
      }
      isPaused = false;
    }
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;
}
