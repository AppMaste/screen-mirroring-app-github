import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/All%20Media%20Screen/All%20Media%20Screen.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Controllers/Splash Screen Controller.dart';
import '../Mediaquery/Media Query.dart';
import 'Select TV Model.dart';

class ScreenMirroring extends StatelessWidget {
  const ScreenMirroring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/ScreenMirroring"),
      child: Scaffold(
        appBar: customappbar(context, 'Screen Mirroring',"/ScreenMirroring"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Text(
                      textAlign: TextAlign.center,
                      """Please make sure that your phone and TV are connected to the same Wifi Network.""",
                      style: GoogleFonts.georama(
                        fontSize: ScreenSize.fSize_15(),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_30()),
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
                          splash2containerController(
                              context,
                              "assets/icons/screen-mirroring-icon.png",
                              "Select TV Model", () {
                                adButtonController.showAB(context, "/TVModelScreen", "/ScreenMirroring", "");
                            // Get.to(() => const TVModelScreen());
                          }),
                          splash2containerController(
                              context,
                              "assets/icons/video player icon.png",
                              "All Media", () {
                                adButtonController.showAB(context, "/AllMediaScreen", "/ScreenMirroring", "");
                            // Get.to(() => const AllMediaScreen());
                          }),
                          SizedBox(height: ScreenSize.fSize_20()),
                          native.getNT("listTileMedium","/ScreenMirroring"),
                          SizedBox(height: ScreenSize.fSize_120()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/ScreenMirroring")
          ],
        ),
      ),
    );
  }
}
