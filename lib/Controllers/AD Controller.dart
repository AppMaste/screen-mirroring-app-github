import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:screen_mirroring_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Mediaquery/Media Query.dart';

final native = Get.put(NativeAds());
final banner = Get.put(BannerAds());

class NativeAds extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Widget getNT(String factoryId, String pagename) {
    NativeAd? nativeAd;
    var isLoaded = false.obs;
    // if (config.value[Get.currentRoute]["Native_Ad_type"] == "admob") {
    nativeAd = NativeAd(
      request: const AdManagerAdRequest(),
      // adUnitId: remoteconfig.value[pagename]["NA"],
      adUnitId: "/6499/example/native",
      listener: NativeAdListener(onAdLoaded: (ad) {
        nativeAd!.load();
        isLoaded.value = true;
        print("Banner ad Loaded");
      }, onAdFailedToLoad: (ad, error) {
        print("Banner ad Failed to Load");
      }),
      // factoryId: wantSmallNativeAd ? "listTile" : "listTileMedium",
      factoryId: factoryId,
    );
    nativeAd.load();
    // }
    return remoteconfig.value[pagename]["NA_type"] == "admob"
        ? Obx(() => (isLoaded.value)
            ? factoryId == "listTile"
                ? Stack(
                    children: [
                      Container(
                        height: ScreenSize.fSize_160(),
                        width: ScreenSize.fSize_350(),
                        // color: Colors.green,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: Colors.black26,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: AdWidget(
                          ad: nativeAd!,
                        ),
                        // color: Colors.blue,
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Container(
                        height: ScreenSize.fSize_250(),
                        width: ScreenSize.fSize_350(),
                        // color: Colors.green,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: Colors.black26,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: AdWidget(
                          ad: nativeAd!,
                        ),
                        // color: Colors.blue,
                      ),
                    ],
                  )
            : factoryId == "listTile"
                ? Container(
                    height: ScreenSize.fSize_150(),
                    width: ScreenSize.fSize_350(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.black26,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    height: ScreenSize.fSize_250(),
                    width: ScreenSize.fSize_350(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.black26,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))
        : remoteconfig.value[pagename]["NA_type"] == "fb"
            ? Container(
                height: factoryId == "listTile"
                    ? ScreenSize.fSize_150()
                    : ScreenSize.fSize_250(),
                width: ScreenSize.fSize_350(),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 25.0,
                    )
                  ],
                ),
                child: FacebookNativeAd(
                  // placementId: "YOUR_PLACEMENT_ID",
                  placementId: remoteconfig.value["Native_FB"],
                  // placementId:
                  //     "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
                  adType: NativeAdType.NATIVE_AD,
                  height: factoryId == "listTile"
                      ? ScreenSize.fSize_150()
                      : ScreenSize.fSize_250(),
                  width: ScreenSize.fSize_350(),
                  backgroundColor: Colors.white,
                  titleColor: Colors.black,
                  descriptionColor: Colors.grey,
                  buttonColor: const Color(0xFF2676d2),
                  buttonTitleColor: Colors.white,
                  buttonBorderColor: const Color(0xFF8bb9eb),
                  listener: (result, value) {
                    print("Native Banner Ad: $result --> $value");
                  },
                ),
              )
            : remoteconfig.value[pagename]["NA_type"] == "null"
                ? Container()
                : GestureDetector(
                    onTap: () {
                      _launchURL(remoteconfig.value[pagename]["Url"]);
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: factoryId == "listTile"
                              ? ScreenSize.fSize_150()
                              : ScreenSize.fSize_250(),
                          width: ScreenSize.fSize_350(),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(remoteconfig
                                      .value[pagename]["Image_Url"]))),
                        ),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_2()))),
                            height: ScreenSize.fSize_16(),
                            width: ScreenSize.fSize_34(),
                            child: Center(
                                child: Text(
                              "Ad",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenSize.fSize_10()),
                            )),
                          ),
                        ),
                      ],
                    ),
                  );
  }
}

class BannerAds extends GetxController {
  late BannerAd bannerAd;

  // var bannerLoaded = false.obs;

  Widget getBN(String page) {
    if (remoteconfig.value[page]["BA_type"] == "admob") {
      bannerAd = BannerAd(
        size: AdSize.fluid,
        adUnitId: remoteconfig.value[page]["BA"],
        // adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              print("Banner ad Loaded");
            },
            onAdFailedToLoad: (ad, error) {}),
        request: const AdRequest(),
      );
      bannerAd.load();
    }

    return remoteconfig.value[page]["BA_type"] == "admob"
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // color: Colors.redAccent,
              height: 50,
              child: AdWidget(
                ad: bannerAd,
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // color: Colors.black12,
              height: 50,
              child: FacebookBannerAd(
                  // placementId: "YOUR_PLACEMENT_ID",
                  placementId: remoteconfig.value["Banner_FB"],
                  bannerSize: BannerSize.STANDARD,
                  listener: (result, value) {
                    print("Banner Ad: $result -->  $value");
                  }),
            ),
          );
  }
}
