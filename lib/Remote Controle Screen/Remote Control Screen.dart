import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Choose TV Brand remote Screen/Choose TV Brand remote Screen.dart';
import '../Controllers/Splash Screen Controller.dart';
import '../Mediaquery/Media Query.dart';
import '../Save remote Screen/save remote screen.dart';

class RemoteControlScreen extends StatelessWidget {
  const RemoteControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/RemoteControlScreen"),
      child: Scaffold(
        appBar: customappbar(context, "Screen Mirroring","/RemoteControlScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage("assets/images/4042177 1.png"),
                      height: ScreenSize.fSize_210(),
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      // height: double.infinity,
                      // width: double.infinity,
                      decoration: boxdecoration,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          splash2containerController(context,
                              "assets/icons/addsquare.png", "Add Remote", () {
                            adButtonController.showAB(
                                context,
                                "/ChooseTVBrandRemoteScreen",
                                "/RemoteControlScreen",
                                "");
                            // Get.to(() => ChooseTVBrandRemoteScreen());
                          }),
                          splash2containerController(
                              context, "assets/icons/save2.png", "Saved Remote",
                              () {
                            adButtonController.showAB(
                                context,
                                "/SaveRemoteScreen",
                                "/RemoteControlScreen",
                                "");
                            // Get.to(() => const SaveRemoteScreen());
                          }),
                          SizedBox(height: ScreenSize.fSize_45()),
                          native.getNT("listTileMedium","/RemoteControlScreen"),
                          SizedBox(height: ScreenSize.fSize_60()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // banner.getBN()
          ],
        ),
      ),
    );
  }
}
