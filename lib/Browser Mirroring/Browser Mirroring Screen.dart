import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Controllers/AD Controller.dart';
import '../Mediaquery/Media Query.dart';

class BrowserMirroringScreen extends StatelessWidget {
  const BrowserMirroringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/BrowserMirroringScreen"),
      child: Scaffold(
        appBar: customappbar(context, "Browser Mirroring","/BrowserMirroringScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(
                          "assets/images/browser-mirroring-image.png"),
                      height: ScreenSize.fSize_250(),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: boxdecoration,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: ScreenSize.fSize_150(),
                            child: Row(
                              children: [
                                SizedBox(width: ScreenSize.fSize_10()),
                                Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: ScreenSize.fSize_28(),
                                          width: ScreenSize.fSize_28(),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors
                                                      .blueAccent.shade100,
                                                  width: 5),
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ScreenSize.fSize_30())),
                                          child: Center(
                                            child: Text(
                                              "1",
                                              style: GoogleFonts.georama(
                                                color: Colors.white,
                                                fontSize: ScreenSize.fSize_10(),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              ScreenSize.fSize_4()),
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: Text(
                                              '-----------',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenSize.fSize_10(),
                                                  letterSpacing: 2,
                                                  color:
                                                      const Color(0xFF1952A5)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: ScreenSize.fSize_28(),
                                          width: ScreenSize.fSize_28(),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors
                                                      .blueAccent.shade100,
                                                  width: 5),
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ScreenSize.fSize_30())),
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: GoogleFonts.georama(
                                                color: Colors.white,
                                                fontSize: ScreenSize.fSize_10(),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: ScreenSize.fSize_40(),
                                            height: ScreenSize.fSize_80()),
                                        Container(
                                          color: Colors.transparent,
                                          width:
                                              ScreenSize.horizontalBlockSize! *
                                                  80,
                                          child: Text(
                                            "Make sure your phone and cast device are connected to the same Wi-Fi.",
                                            style: GoogleFonts.georama(
                                              fontWeight: FontWeight.w500,
                                              fontSize: ScreenSize.fSize_12(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: ScreenSize.fSize_30(),
                                      left: ScreenSize.fSize_34(),
                                      child: SizedBox(
                                        width: ScreenSize.horizontalBlockSize! *
                                            80,
                                        child: Text(
                                          "Open this website on the other device:",
                                          style: GoogleFonts.georama(
                                            fontWeight: FontWeight.w500,
                                            fontSize: ScreenSize.fSize_13(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_45()),
                              Text(
                                browsertext,
                                style: GoogleFonts.georama(
                                  fontSize: ScreenSize.fSize_17(),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF123F8E),
                                ),
                              ),
                              SizedBox(width: ScreenSize.fSize_20()),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: browsertext));
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      backgroundColor: Colors.black,
                                      title: "Text Copied",
                                      message: browsertext,
                                      icon: GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.white)),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                },
                                child: Image(
                                  image:
                                      const AssetImage("assets/icons/copy.png"),
                                  height: ScreenSize.fSize_30(),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Padding(
                            padding:
                                EdgeInsets.only(left: ScreenSize.fSize_45()),
                            child: Container(
                              color: Colors.transparent,
                              child: Text(
                                "The IP address may change every time you connect, so please make sure each number is entered correctly in the browser address bar.",
                                style: GoogleFonts.georama(
                                    fontSize: ScreenSize.fSize_10(),
                                    color: Color(0xFF8A8A8A),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_90()),
                          Text(
                            "*Do not leave this page before connected.",
                            style: GoogleFonts.georama(
                                color: const Color(0xFF123F8E),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          GestureDetector(
                            onTap: () {
                              // BottomSheetExample();
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 110,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: ScreenSize.fSize_20()),
                                          Image(
                                            image: const AssetImage(
                                                "assets/icons/cast (2) 1.png"),
                                            height: ScreenSize.fSize_45(),
                                          ),
                                          SizedBox(
                                              height: ScreenSize.fSize_20()),
                                          SizedBox(
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                75,
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Start recording or casting with Screen Mirroring?",
                                              style: GoogleFonts.georama(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      ScreenSize.fSize_20()),
                                            ),
                                          ),
                                          SizedBox(
                                              height: ScreenSize.fSize_40()),
                                          SizedBox(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  80,
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Screen Mirroring',
                                                      style: GoogleFonts.georama(
                                                          fontSize: ScreenSize
                                                              .fSize_14(),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          ' will have access to all of the information that is visible on your screen or played from your device while recording or casting. This includes information such as passwords, payment details, photos, messages and audio that you play.',
                                                      style: GoogleFonts.georama(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: ScreenSize
                                                              .fSize_14()),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          SizedBox(
                                              height: ScreenSize.fSize_20()),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                  // Get.offAll(() => const HomeScreen());
                                                },
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    height:
                                                        ScreenSize.fSize_45(),
                                                    width:
                                                        ScreenSize.fSize_150(),
                                                    decoration: BoxDecoration(
                                                      // image: const DecorationImage(
                                                      //     image: AssetImage("assets/icons/arrowright.png"),
                                                      //     scale: 1.8),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                            ScreenSize
                                                                .fSize_30()),
                                                      ),
                                                      gradient:
                                                          const LinearGradient(
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                        colors: [
                                                          Color(0xFF878787),
                                                          Color(0xFFDFDFDF),
                                                        ],
                                                      ),
                                                      // color: Colors.blue,
                                                      // shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color:
                                                              Color(0xFFCBCBCB),
                                                          width: 5),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black38,
                                                            blurRadius: 3,
                                                            offset:
                                                                Offset(0.5, 2)
                                                            // spreadRadius: 6,
                                                            // blurStyle: BlurStyle.outer,
                                                            )
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Cancel",
                                                        style: GoogleFonts.georama(
                                                            color: Colors.black,
                                                            fontSize: ScreenSize
                                                                .fSize_17(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                  OpenSettings.openCastSetting();
                                                  // adButtonController.showAB(context, "/HomeScreen", "/BrowserMirroringScreen", "");
                                                  // Get.to(()=> )
                                                  // Get.offAll(() => const HomeScreen());
                                                },
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    height:
                                                        ScreenSize.fSize_45(),
                                                    width:
                                                        ScreenSize.fSize_150(),
                                                    decoration: BoxDecoration(
                                                      // image: const DecorationImage(
                                                      //     image: AssetImage("assets/icons/arrowright.png"),
                                                      //     scale: 1.8),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                            ScreenSize
                                                                .fSize_30()),
                                                      ),
                                                      gradient:
                                                          const LinearGradient(
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                        colors: [
                                                          Color(0xFF2C85E3),
                                                          Color(0xFF0D3A7A),
                                                        ],
                                                      ),
                                                      // color: Colors.blue,
                                                      // shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors
                                                              .blue.shade300,
                                                          width: 5),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black38,
                                                            blurRadius: 3,
                                                            offset:
                                                                Offset(0.5, 2)
                                                            // spreadRadius: 6,
                                                            // blurStyle: BlurStyle.outer,
                                                            )
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Start Now",
                                                        style: GoogleFonts.georama(
                                                            color: Colors.white,
                                                            fontSize: ScreenSize
                                                                .fSize_17(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              // Get.offAll(() => const HomeScreen());
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: ScreenSize.fSize_55(),
                                width: ScreenSize.horizontalBlockSize! * 71,
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
                                    "Start Mirroring",
                                    style: GoogleFonts.georama(
                                        color: Colors.white,
                                        fontSize: ScreenSize.fSize_17(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_120()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/BrowserMirroringScreen")
          ],
        ),
      ),
    );
  }
}
