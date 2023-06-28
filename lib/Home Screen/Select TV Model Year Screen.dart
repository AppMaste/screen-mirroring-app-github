import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Process%20running%20Screen/Process%20running%20Screen.dart';
import 'package:screen_mirroring_app/Year%20Picker%20Page/Year%20Picker.dart';

import '../Controllers/Controllers.dart';
import '../Local Data/Local Data.dart';
import '../Mediaquery/Media Query.dart';

class SelectTVModelYearScreen extends StatefulWidget {
  const SelectTVModelYearScreen({Key? key}) : super(key: key);

  @override
  State<SelectTVModelYearScreen> createState() =>
      _SelectTVModelYearScreenState();
}

class _SelectTVModelYearScreenState extends State<SelectTVModelYearScreen> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/SelectTVModelYearScreen"),
      child: Scaffold(
        appBar: customappbar(context, "Select TV Model - Year","/SelectTVModelYearScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_20()),
                  native.getNT("listTile","/SelectTVModelYearScreen"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Text(
                    "Select TV Model - Year",
                    style: GoogleFonts.georama(
                      fontSize: ScreenSize.fSize_25(),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    // height: double.infinity,
                    width: double.infinity,
                    decoration: boxdecoration,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        Container(
                          height: ScreenSize.fSize_250(),
                          color: Colors.transparent,
                          child: Center(
                            child: CupertinoPicker(
                              magnification: 1.5,
                              backgroundColor: Colors.transparent,
                              itemExtent: 40,
                              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent),
                              looping: true,
                              useMagnifier: false,
                              diameterRatio: 3.0,
                              onSelectedItemChanged: (int value) {},
                              children: [
                                demotext(context, "2001 - 2005"),
                                demotext(context, "2006 - 2010"),
                                demotext(context, "2011 - 2015"),
                                demotext(context, "2016 - 2020"),
                                demotext(context, "2021 - 2025"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        GestureDetector(
                          onTap: () {
                            adButtonController.showAB(
                                context,
                                "/ProcessRunningScreen",
                                "/SelectTVModelYearScreen",
                                "");
                            // Get.to(() => const ProcessRunningScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: ScreenSize.fSize_50(),
                              // left: ScreenSize.horizontalBlockSize! * 70,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: ScreenSize.fSize_45(),
                                width: ScreenSize.fSize_150(),
                                decoration: BoxDecoration(
                                  // image: const DecorationImage(
                                  //     image: AssetImage("assets/icons/arrowright.png"),
                                  //     scale: 1.8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenSize.fSize_30(),
                                    ),
                                  ),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3092F3),
                                      Color(0xFF123F8E),
                                    ],
                                  ),
                                  // color: Colors.blue,
                                  // shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.blueAccent.shade100,
                                      width: 5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 3,
                                        offset: Offset(0.5, 2)
                                        // spreadRadius: 6,
                                        // blurStyle: BlurStyle.outer,
                                        )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "NEXT",
                                    style: GoogleFonts.georama(
                                        color: Colors.white,
                                        fontSize: ScreenSize.fSize_17(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_80()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            banner.getBN("/SelectTVModelYearScreen")
          ],
        ),
      ),
    );
  }
}
