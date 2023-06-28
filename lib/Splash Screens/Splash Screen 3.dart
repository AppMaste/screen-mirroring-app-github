import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';

import '../Controllers/Splash Screen Controller.dart';
import '../Home Screen/Home Screen.dart';
import '../Mediaquery/Media Query.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/SplashScreen3"),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF5ee2ff),
                    Color(0xFFd8f9ff),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/4144850 1.png"),
                ),
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
                        // Colors.blue,
                        const Color.fromRGBO(73, 164, 211, 1),
                        const Color.fromRGBO(73, 164, 211, 1)),
                    SizedBox(width: ScreenSize.fSize_10()),
                    rowContainerController(
                        context,
                        // Colors.blue,
                        const Color.fromRGBO(73, 164, 211, 1),
                        const Color.fromRGBO(73, 164, 211, 1)),
                    SizedBox(width: ScreenSize.fSize_10()),
                    rowContainerController(
                        context,
                        // Colors.blueGrey,
                        const Color.fromRGBO(49, 145, 243, 1),
                        const Color.fromRGBO(18, 62, 140, 1)),
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_30()),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenSize.horizontalBlockSize! * 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("assets/shapes/splash 3.png"),
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
                        image: AssetImage("assets/shapes/splash 3.3.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            GestureDetector(
              onTap: () {
                adButtonController.showAB(context, "/HomeScreen", "/SplashScreen3", '');
                // Get.offAll(() =>  HomeScreen());
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
                    child: Center(
                      child: Text(
                        "START",
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
            // banner.getBN()
          ],
        ),
      ),
    );
  }
}
