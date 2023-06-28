import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Rename%20Device%20name%20Screen/Rename%20device%20Screen.dart';

import '../Mediaquery/Media Query.dart';

class TVRemoteControlScreen extends StatelessWidget {
  TVRemoteControlScreen({Key? key}) : super(key: key);

  var data = Get.arguments;

  // TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("objectttt $data");
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/TVRemoteControlScreen"),
      child: Scaffold(
        appBar: customappbar(context, data.toString(),"/TVRemoteControlScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_90()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 15,
                        width: ScreenSize.horizontalBlockSize! * 15,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/icons/element3.png"),
                                scale: 2.0),
                            color: const Color(0xFF123F8E),
                            borderRadius: BorderRadius.all(
                              Radius.circular(ScreenSize.fSize_10()),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87.withOpacity(0.6),
                                  blurRadius: 3,
                                  offset: Offset(0, 3))
                            ]),
                      ),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 1.7),
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 15,
                        width: ScreenSize.horizontalBlockSize! * 15,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/icons/testbutton.png"),
                                scale: 2.0),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87.withOpacity(0.6),
                                  blurRadius: 3,
                                  offset: const Offset(0, 3))
                            ]),
                      ),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 1.7),
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 15,
                        width: ScreenSize.horizontalBlockSize! * 15,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/icons/volumecross.png"),
                                scale: 2.0),
                            color: const Color(0xFF123F8E),
                            borderRadius: BorderRadius.all(
                              Radius.circular(ScreenSize.fSize_10()),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87.withOpacity(0.6),
                                  blurRadius: 3,
                                  offset: Offset(0, 3))
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_40()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 45,
                        width: ScreenSize.fSize_48(),
                        decoration: BoxDecoration(
                            color: const Color(0xFF123F8E),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87.withOpacity(0.6),
                                  blurRadius: 3,
                                  offset: Offset(0, 3))
                            ],
                            borderRadius:
                                BorderRadius.circular(ScreenSize.fSize_24())),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/icons/arrowup2.png"),
                                  height: ScreenSize.fSize_30()),
                              Text(
                                "CH",
                                style: GoogleFonts.georama(
                                    color: Colors.white,
                                    fontSize: ScreenSize.fSize_17(),
                                    fontWeight: FontWeight.w600),
                              ),
                              Image(
                                  image:
                                      AssetImage("assets/icons/arrowdown2.png"),
                                  height: ScreenSize.fSize_30()),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: ScreenSize.horizontalBlockSize! * 45,
                            width: ScreenSize.horizontalBlockSize! * 46,
                            decoration: BoxDecoration(
                                color: const Color(0xFF123F8E),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black87.withOpacity(0.6),
                                      blurRadius: 3,
                                      offset: const Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.fSize_25())),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                    image:
                                        AssetImage("assets/icons/arrowup2.png"),
                                    height: ScreenSize.fSize_30()),
                                Container(
                                  height: ScreenSize.fSize_50(),
                                  width: ScreenSize.fSize_50(),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: ScreenSize.fSize_2(),
                                          color: Colors.white)),
                                  child: Center(
                                    child: Text(
                                      "OK",
                                      style: GoogleFonts.georama(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenSize.fSize_16()),
                                    ),
                                  ),
                                ),
                                Image(
                                    image: AssetImage(
                                        "assets/icons/arrowdown2.png"),
                                    height: ScreenSize.fSize_30()),
                              ],
                            ),
                          ),
                          Container(
                            height: ScreenSize.horizontalBlockSize! * 45,
                            width: ScreenSize.horizontalBlockSize! * 46,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.fSize_25())),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/icons/dropdownleft.png"),
                                  height: ScreenSize.fSize_30(),
                                ),
                                Image(
                                  image: AssetImage(
                                      "assets/icons/dropdownright.png"),
                                  height: ScreenSize.fSize_30(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 45,
                        width: ScreenSize.fSize_48(),
                        decoration: BoxDecoration(
                            color: const Color(0xFF123F8E),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87.withOpacity(0.6),
                                  blurRadius: 3,
                                  offset: Offset(0, 3))
                            ],
                            borderRadius:
                                BorderRadius.circular(ScreenSize.fSize_24())),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/icons/volumeup.png"),
                                  height: ScreenSize.fSize_24()),
                              Text(
                                "CH",
                                style: GoogleFonts.georama(
                                    color: Colors.white,
                                    fontSize: ScreenSize.fSize_17(),
                                    fontWeight: FontWeight.w600),
                              ),
                              Image(
                                  image:
                                      AssetImage("assets/icons/volumelow.png"),
                                  height: ScreenSize.fSize_24()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_40()),
                  Container(
                    height: ScreenSize.horizontalBlockSize! * 15,
                    width: ScreenSize.horizontalBlockSize! * 15,
                    decoration: BoxDecoration(
                        color: const Color(0xFF123F8E),
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/icons/telephone-keypad-with-ten-keys 1.png"),
                            scale: 2.0),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87.withOpacity(0.6),
                              blurRadius: 3,
                              offset: const Offset(0, 3))
                        ]),
                  ),
                ],
              ),
            ),
            banner.getBN("/TVRemoteControlScreen")
          ],
        ),
      ),
    );
  }
}
