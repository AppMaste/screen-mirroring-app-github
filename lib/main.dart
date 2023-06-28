import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:screen_mirroring_app/Notification%20Service/notificationservice.dart';
import 'package:screen_mirroring_app/Splash%20Screens/Main%20Screen.dart';
import 'package:screen_mirroring_app/demo%20Page.dart';
import 'package:screen_mirroring_app/whatsapp%20direct%20screen/Whatsapp%20Direct%20SScreen.dart';

import 'All Media Screen/All Media Screen.dart';
import 'All Media Screen/Audio File/Audio.dart';
import 'All Media Screen/Select media Screen/Select Image Screen.dart';
import 'All Media Screen/Select media Screen/Select Video Screen.dart';
import 'Browser Mirroring/Browser Mirroring Screen.dart';
import 'Choose TV Brand remote Screen/Choose TV Brand remote Screen.dart';
import 'Home Screen/Home Screen.dart';
import 'Home Screen/Screen mirroring.dart';
import 'Home Screen/Select TV Model Year Screen.dart';
import 'Home Screen/Select TV Model.dart';
import 'Phones Screen to TV Screen/Phones Screen to TV Screen.dart';
import 'Process running Screen/Process Complete Screen.dart';
import 'Process running Screen/Process running Screen.dart';
import 'Remote Controle Screen/Remote Control Screen.dart';
import 'Rename Device name Screen/Rename device Screen.dart';
import 'Save remote Screen/save remote screen.dart';
import 'Screen Mirroring Detail/detail.dart';
import 'Select Video Screen/Select Video Screen.dart';
import 'Splash Screens/Splash Screen 1.dart';
import 'Splash Screens/Splash Screen 2.dart';
import 'Splash Screens/Splash Screen 3.dart';
import 'Test Remote Screen/Test remote scren.dart';
import 'Tv Remote Control Screen/TV Remote Control Screen.dart';
// import 'package:timezone/timezone.dart' as tz;

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap remoteconfig = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    // adUnitId: "/6499/example/app-open",
    adUnitId: remoteconfig.value['AppOpen'],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        print("Ad Loaded.................................");
        appOpenAd = ad;
        // isLoaded=true;
        ad.show();
      },
      onAdFailedToLoad: (error) {
        // loadAd();
        AppOpenAd.load(
          // adUnitId: "/6499/example/app-open",
          adUnitId: remoteconfig.value['AppOpen'],
          // adUnitId: "ca-app-pub-3940256099942544/3419835294",
          orientation: AppOpenAd.orientationPortrait,
          request: const AdManagerAdRequest(),
          adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              print("Ad Loaded.................................");
              appOpenAd = ad;
              // isLoaded=true;
              ad.show();
            },
            onAdFailedToLoad: (error) {
              // loadAd();
              // Handle the error.
            },
          ),
        );

        // Handle the error.
      },
    ),
  );
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "Hello", "Firebase Messaging",
    importance: Importance.high, playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebasemessgingBackgroundMessagingHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp();
  print("A bg message just showed up : ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  NotificationService().initNotification();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(
      (message) => _firebasemessgingBackgroundMessagingHandler(message));

  initConfig().whenComplete(() {
    remoteconfig.value = json.decode(remoteConfig.getString('Mirroring'));
    loadAd();
  });

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => MainScreen(),
      "/SplashScreen1": (context) => const SplashScreen1(),
      "/SplashScreen2": (context) => const SplashScreen2(),
      "/SplashScreen3": (context) => const SplashScreen3(),
      "/HomeScreen": (context) => HomeScreen(),
      "/ScreenMirroring": (context) => const ScreenMirroring(),
      "/SaveRemoteScreen": (context) => const SaveRemoteScreen(),
      "/BrowserMirroringScreen": (context) => const BrowserMirroringScreen(),
      "/WhatsappDirectScreen": (context) => WhatsappDirectScreen(),
      "/TVModelScreen": (context) => const TVModelScreen(),
      "/TestRemoteScreen": (context) => TestRemoteScreen(),
      "/AllMediaScreen": (context) => const AllMediaScreen(),
      "/SelectTVModelYearScreen": (context) => const SelectTVModelYearScreen(),
      "/ProcessRunningScreen": (context) => const ProcessRunningScreen(),
      "/ProcessCompleteScreen": (context) => const ProcessCompleteScreen(),
      "/PhonesScreenToTVScreen": (context) => const PhonesScreenToTVScreen(),
      "/ScreenMirroringDetail": (context) => const ScreenMirroringDetail(),
      "/TVRemoteControlScreen": (context) => TVRemoteControlScreen(),
      "/RenameDeviceScreen": (context) => RenameDeviceScreen(),
      "/SelectMediaScreen": (context) => SelectMediaScreen(),
      "/SelectImageScreen": (context) => SelectImageScreen(),
      "/AudioPickScreen": (context) => const AudioPickScreen(),
      "/RemoteControlScreen": (context) => const RemoteControlScreen(),
      "/AlbumPage": (context) => AlbumPage(),
      "/ViewerPage": (context) => ViewerPage(),
      "/VideoProvider": (context) => const VideoProvider(mediumId: ''),
      "/ChooseTVBrandRemoteScreen": (context) =>
          const ChooseTVBrandRemoteScreen(),
    },
    // home: MainScreen(),
  ));
}