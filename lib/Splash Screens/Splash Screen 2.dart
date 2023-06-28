import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Splash%20Screen%20Controller.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';

import 'Splash Screen 3.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/SplashScreen2"),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFa954ff),
                    Color(0xFFe8d2ff),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage("assets/images/4192850 1.png"),
                      height: ScreenSize.fSize_250(),
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_30()),
                  splash2Controller(context, "assets/icons/cast-video-icon.png",
                      "How can I cast videos?"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: ScreenSize.horizontalBlockSize! * 14,
                          width: ScreenSize.horizontalBlockSize! * 80,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.all(Radius.circular(
                                ScreenSize.fSize_10(),
                              )),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 2),
                                  blurRadius: 5,
                                ),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: ScreenSize.fSize_24()),
                              Image(
                                image:
                                AssetImage("assets/icons/video-player-icon.png"),
                                height: ScreenSize.fSize_45(),
                              ),
                              SizedBox(width: ScreenSize.fSize_20()),
                              Text(
                                "Click to play",
                                style: GoogleFonts.georama(
                                    fontSize: ScreenSize.fSize_17(),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: ScreenSize.horizontalBlockSize! * 56),
                          Image(
                              image: AssetImage("assets/images/5972520 1.png"),
                              height: ScreenSize.fSize_100()),
                        ],
                      )
                    ],
                  ),
                  // splash2Controller(context, "assets/icons/video-player-icon.png",
                  //     "Click to play"),
                  SizedBox(height: ScreenSize.fSize_100()),
                  Text(
                    "Click to Play",
                    style: GoogleFonts.georama(
                        fontSize: ScreenSize.fSize_24(),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: ScreenSize.fSize_40()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rowContainerController(
                          context,
                          // Colors.blueGrey,
                          const Color.fromRGBO(73, 164, 211, 1),
                          const Color.fromRGBO(73, 164, 211, 1)),
                      SizedBox(width: ScreenSize.fSize_10()),
                      rowContainerController(
                          context,
                          // Colors.blue,
                          const Color.fromRGBO(49, 145, 243, 1),
                          const Color.fromRGBO(18, 62, 140, 1)),
                      SizedBox(width: ScreenSize.fSize_10()),
                      rowContainerController(
                          context,
                          // Colors.blue,
                          const Color.fromRGBO(73, 164, 211, 1),
                          const Color.fromRGBO(73, 164, 211, 1)),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_140()),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenSize.horizontalBlockSize! * 50,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("assets/shapes/splash 2.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenSize.horizontalBlockSize! * 60,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("assets/shapes/splash 2.2.png"),
                        fit: BoxFit.cover)),
              ),
            ),

            GestureDetector(
              onTap: () {
                adButtonController.showAB(context, "/SplashScreen3", "/SplashScreen2", "");
                // Get.to(() => const SplashScreen3());
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ScreenSize.fSize_50(),
                  left: ScreenSize.horizontalBlockSize! * 70,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: ScreenSize.fSize_55(),
                    width: ScreenSize.fSize_55(),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/icons/arrowright.png"),
                          scale: 1.8),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF3092F3),
                          Color(0xFF123F8E),
                        ],
                      ),
                      // color: Colors.blue,
                      shape: BoxShape.circle,
                      border:
                      Border.all(color: Colors.blueAccent.shade100, width: 5),
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
                  ),
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
