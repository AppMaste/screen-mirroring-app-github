import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';
import 'package:screen_mirroring_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

final ADButtonController adButtonController = Get.put(ADButtonController());
final ADBackButtonController backButtonController =
    Get.put(ADBackButtonController());

class ADButtonController extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx Counter = 1.obs;

  showAB(BuildContext context, String nextpage, String thispage, var aa) async {
    // clickCount.value++;
    // ignore: unrelated_type_equality_checks
    if (remoteconfig.value["counter"] == Counter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: ScreenSize.fSize_30(),
                        height: ScreenSize.fSize_30(),
                        child: const CircularProgressIndicator()),
                    const Text("Ad is loading..."),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (remoteconfig.value[thispage]["IA_type"] == 'admob') {
        InterstitialAd.load(
          adUnitId: remoteconfig.value[thispage]["interstitial_Admob"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            nextpage != 'stop' ? Get.toNamed(nextpage, arguments: aa) : null;
            Counter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: remoteconfig.value[thispage]["interstitial_Admob"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                nextpage != 'stop'
                    ? Get.toNamed(nextpage, arguments: aa)
                    : null;
                Counter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                nextpage != 'stop'
                    ? Get.toNamed(nextpage, arguments: aa)
                    : null;
                Counter.value = 1;
              }),
            );
          }),
        );
      }

      if (remoteconfig.value[thispage]["IA_type"] == 'fb') {
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: remoteconfig.value["Interstitial_FB"],
          // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
          listener: (result, value) {
            if (result == InterstitialAdResult.LOADED) {
              FacebookInterstitialAd.showInterstitialAd();
              Navigator.pop(context);
              nextpage != 'stop' ? Get.toNamed(nextpage, arguments: aa) : null;
              Counter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              nextpage != 'stop' ? Get.toNamed(nextpage, arguments: aa) : null;
              Counter.value = 1;
            }
          },
        );
      }
      if (remoteconfig.value[thispage]["IA_type"] == "url") {
        _launchURL(remoteconfig.value[thispage]["Url"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            nextpage != 'stop' ? Get.toNamed(nextpage, arguments: aa) : null;
            Counter.value = 1;
          },
        );
      }
    } else {
      // Get.to(() => const FirstPage());
      nextpage != 'stop' ? Get.toNamed(nextpage, arguments: aa) : null;
      Counter.value++;
      // controller.incrementClickCount(context, 'FirstPage');
    }
  }
}

class ADBackButtonController extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx BackCounter = 1.obs;

  showAB(BuildContext context,String thispage) async {
    // clickCount.value++;
    // ignore: unrelated_type_equality_checks
    if (remoteconfig.value["BackCounter"] == BackCounter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: ScreenSize.fSize_30(),
                        height: ScreenSize.fSize_30(),
                        child: const CircularProgressIndicator()),
                    const Text("Ad is loading..."),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (remoteconfig.value[thispage]["IA_type"] == 'admob') {
        InterstitialAd.load(
          adUnitId: remoteconfig.value[thispage]["interstitial_Admob"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            Navigator.pop(context);
            // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
            BackCounter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: remoteconfig.value[thispage]["interstitial_Admob"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                Navigator.pop(context);
                // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
                BackCounter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                Navigator.pop(context);
                // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
                BackCounter.value = 1;
              }),
            );
          }),
        );
      }

      if (remoteconfig.value[thispage]["IA_type"] == 'fb') {
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: remoteconfig.value["Interstitial_FB"],
          // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
          listener: (result, value) {
            if (result == InterstitialAdResult.LOADED) {
              FacebookInterstitialAd.showInterstitialAd();
              Navigator.pop(context);
              Navigator.pop(context);
              // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
              BackCounter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              Navigator.pop(context);
              // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
              BackCounter.value = 1;
            }
          },
        );
      }
      if (remoteconfig.value[thispage]["IA_type"] == "url") {
        _launchURL(remoteconfig.value[thispage]["Url"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            Navigator.pop(context);
            // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
            BackCounter.value = 1;
          },
        );
      }
    } else {
      // Get.to(() => const FirstPage());
      Navigator.pop(context);
      // priviewspage != 'stop' ? Get.toNamed(priviewspage) : null;
      BackCounter.value++;
      // controller.incrementClickCount(context, 'FirstPage');
    }
  }
}
