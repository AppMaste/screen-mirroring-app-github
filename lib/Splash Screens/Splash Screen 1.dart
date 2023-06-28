import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Splash%20Screen%20Controller.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';
import 'package:screen_mirroring_app/Splash%20Screens/Splash%20Screen%202.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../Notification Service/notificationservice.dart';
import '../main.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("objecttttt ${remoteconfig.value["MSG_Title"]}");
    // ScreenSize.sizerInit(context);
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/SplashScreen1"),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepOrange.shade400,
                  Colors.orange.withOpacity(0.1),
                ],
              )),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: ScreenSize.fSize_40()),
                  Center(
                    child: Image(
                      image: AssetImage("assets/images/4644640 1.png"),
                      height: ScreenSize.fSize_150(),
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_30()),
                  splashController(
                      context, "assets/icons/tv screen-icon.png", "LG TV"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: ScreenSize.horizontalBlockSize! * 13,
                          width: ScreenSize.horizontalBlockSize! * 75,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  ScreenSize.fSize_10(),
                                ),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: ScreenSize.fSize_30()),
                              Image(
                                image: AssetImage(
                                    "assets/icons/tv screen-icon.png"),
                                height: ScreenSize.fSize_30(),
                              ),
                              SizedBox(width: ScreenSize.fSize_20()),
                              Text(
                                "SAMSUNG TV ",
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
                          SizedBox(width: ScreenSize.horizontalBlockSize! * 58),
                          Image(
                              image: AssetImage("assets/images/5972520 1.png"),
                              height: ScreenSize.fSize_100()),
                        ],
                      )
                    ],
                  ),
                  // splashController(
                  //     context, "assets/icons/tv screen-icon.png", "SAMSUNG TV"),
                  SizedBox(height: ScreenSize.fSize_100()),
                  Text(
                    "Connect One Device",
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
                          const Color.fromRGBO(49, 145, 243, 1),
                          const Color.fromRGBO(18, 62, 140, 1)),
                      SizedBox(width: ScreenSize.fSize_10()),
                      rowContainerController(
                          context,
                          // Colors.blue,
                          const Color.fromRGBO(73, 164, 211, 1),
                          const Color.fromRGBO(73, 164, 211, 1)),
                      SizedBox(width: ScreenSize.fSize_10()),
                      rowContainerController(
                          context,
                          // Colors.blue,
                          const Color.fromRGBO(73, 164, 211, 1),
                          const Color.fromRGBO(73, 164, 211, 1)),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_120())
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenSize.horizontalBlockSize! * 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("assets/shapes/splash 1.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenSize.horizontalBlockSize! * 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("assets/shapes/splash 1.1.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            GestureDetector(
              onTap: () {
                tz.initializeTimeZones();
                NotificationService().showNotification(
                    1,
                    "${remoteconfig.value["MSG_Title"]}",
                    "${remoteconfig.value["MSG_Body"]}");
                adButtonController.showAB(
                    context, "/SplashScreen2", "/SplashScreen1", "");
                // Get.to(() => const SplashScreen2());
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
                      border: Border.all(
                          color: Colors.blueAccent.shade100, width: 5),
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
