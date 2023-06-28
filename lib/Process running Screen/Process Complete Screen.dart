import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Mediaquery/Media Query.dart';
import "../Phones Screen to TV Screen/Phones Screen to TV Screen.dart";

class ProcessCompleteScreen extends StatelessWidget {
  const ProcessCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/ProcessCompleteScreen"),
      child: Scaffold(
        appBar: customappbar(context, "Screen Mirroring","/ProcessCompleteScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(
                        "assets/images/process complete image.png",
                      ),
                      height: ScreenSize.fSize_250(),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: boxdecoration,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_70()),
                          Text(
                            "Progress Complete",
                            style: GoogleFonts.georama(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_20()),
                          ),
                          SizedBox(height: ScreenSize.fSize_30()),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: ScreenSize.fSize_30()),
                                  const Image(
                                    image: AssetImage(
                                        "assets/images/chainlink.png"),
                                  ),
                                  SizedBox(width: ScreenSize.fSize_15()),
                                  Text(
                                    "Scanning for TVs",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF123F8E),
                                        fontSize: ScreenSize.fSize_17()),
                                  )
                                ],
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                              Row(
                                children: [
                                  SizedBox(width: ScreenSize.fSize_30()),
                                  const Image(
                                    image: AssetImage(
                                        "assets/images/chainlink.png"),
                                  ),
                                  SizedBox(width: ScreenSize.fSize_15()),
                                  Text(
                                    "Detecting Model",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF123F8E),
                                        fontSize: ScreenSize.fSize_17()),
                                  )
                                ],
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                              Row(
                                children: [
                                  SizedBox(width: ScreenSize.fSize_30()),
                                  const Image(
                                    image: AssetImage(
                                        "assets/images/chainlink.png"),
                                  ),
                                  SizedBox(width: ScreenSize.fSize_15()),
                                  Text(
                                    "Installing Drivers",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF123F8E),
                                        fontSize: ScreenSize.fSize_17()),
                                  )
                                ],
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                              Row(
                                children: [
                                  SizedBox(width: ScreenSize.fSize_30()),
                                  const Image(
                                    image: AssetImage(
                                        "assets/images/chainlink.png"),
                                  ),
                                  SizedBox(width: ScreenSize.fSize_15()),
                                  Text(
                                    "Connecting",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF123F8E),
                                        fontSize: ScreenSize.fSize_17()),
                                  ),
                                ],
                              ),
                              SizedBox(height: ScreenSize.fSize_30()),
                              GestureDetector(
                                onTap: () {
                                  adButtonController.showAB(context, "/PhonesScreenToTVScreen", "/ProcessCompleteScreen", "");
                                  // Get.to(() => const PhonesScreenToTVScreen());
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
                              SizedBox(height: ScreenSize.fSize_30())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/ProcessCompleteScreen")
          ],
        ),
      ),
    );
  }
}
