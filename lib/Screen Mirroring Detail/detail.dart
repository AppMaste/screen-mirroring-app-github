import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Mediaquery/Media Query.dart';

class ScreenMirroringDetail extends StatelessWidget {
  const ScreenMirroringDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/ScreenMirroringDetail"),
      child: Scaffold(
        appBar: customappbar(context, "Screen Mirroring","/ScreenMirroringDetail"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_30()),
                    native.getNT("listTile","/ScreenMirroringDetail"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    Container(
                      width: double.infinity,
                      decoration: boxdecoration,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Image(
                              image: AssetImage("assets/images/info-image1.png"),
                              height: ScreenSize.fSize_150(),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text(
                            "Connect the phone and TV to the same WIFI network",
                            style: GoogleFonts.georama(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_8()),
                            child: Divider(
                              height: ScreenSize.fSize_10(),
                              color: Color(0xFF94BADD),
                              thickness: ScreenSize.fSize_2(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Image(
                              image: AssetImage("assets/images/info-image2.png"),
                              height: ScreenSize.fSize_150(),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text(
                            "Enable miracast display on your TV",
                            style: GoogleFonts.georama(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_8()),
                            child: Divider(
                              height: ScreenSize.fSize_10(),
                              color: Color(0xFF94BADD),
                              thickness: ScreenSize.fSize_2(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Image(
                              image: AssetImage("assets/images/info-image3.png"),
                              height: ScreenSize.fSize_150(),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text(
                            textAlign: TextAlign.center,
                            """Click on NEXT button, for enable Wireless
Display & choose your TV""",
                            style: GoogleFonts.georama(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_60()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/ScreenMirroringDetail")
          ],
        ),
      ),
    );
  }
}
