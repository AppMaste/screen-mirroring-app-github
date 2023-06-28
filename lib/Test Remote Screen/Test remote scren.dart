import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Mediaquery/Media Query.dart';
import '../Rename Device name Screen/Rename device Screen.dart';

class TestRemoteScreen extends StatelessWidget {
  TestRemoteScreen({Key? key}) : super(key: key);

  var data = Get.arguments;
late BuildContext contextsada ;
  @override
  Widget build(BuildContext context) {
    // print("dataa $data");
    return WillPopScope(
       onWillPop: () => backButtonController.showAB(context, "/TestRemoteScreen"),
      child: Scaffold(
        appBar: customappbar(context, data.toString(),"/TestRemoteScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      color: Colors.transparent,
                      width: ScreenSize.horizontalBlockSize! * 70,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Test every remote test button one by one pointing towards your tv",
                        style: GoogleFonts.georama(
                          color: Colors.white,
                          fontSize: ScreenSize.fSize_15(),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      width: double.infinity,
                      decoration: boxdecoration,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_40()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      contextsada = context;
                                      showModalBottomSheet(
                                        context: contextsada,
                                        builder: (BuildContext contextsada) {
                                          return Container(
                                            // height: ScreenSize.horizontalBlockSize! * 30,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      height: ScreenSize
                                                          .fSize_20()),
                                                  Text(
                                                    "Is TV Responded?",
                                                    style: GoogleFonts.georama(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: ScreenSize
                                                            .fSize_17()),
                                                  ),
                                                  SizedBox(
                                                      height: ScreenSize
                                                          .fSize_20()),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.back();
                                                          // Get.offAll(() => const HomeScreen());
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            bottom: ScreenSize
                                                                .fSize_50(),
                                                            // left: ScreenSize.horizontalBlockSize! * 70,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Container(
                                                              height: ScreenSize
                                                                  .fSize_45(),
                                                              width: ScreenSize
                                                                  .fSize_150(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                // image: const DecorationImage(
                                                                //     image: AssetImage("assets/icons/arrowright.png"),
                                                                //     scale: 1.8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      ScreenSize
                                                                          .fSize_30()),
                                                                ),
                                                                gradient:
                                                                    const LinearGradient(
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment
                                                                      .topCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xFF123F8E),
                                                                    Color(
                                                                        0xFF3092F3),
                                                                  ],
                                                                ),
                                                                // color: Colors.blue,
                                                                // shape: BoxShape.circle,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .blueAccent
                                                                        .shade100,
                                                                    width: 5),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black38,
                                                                      blurRadius:
                                                                          3,
                                                                      offset:
                                                                          Offset(
                                                                              0.5,
                                                                              2)
                                                                      // spreadRadius: 6,
                                                                      // blurStyle: BlurStyle.outer,
                                                                      )
                                                                ],
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "No",
                                                                  style: GoogleFonts.georama(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          ScreenSize
                                                                              .fSize_17(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                        Navigator.pop(contextsada);
                                                          adButtonController.showAB(
                                                              context,
                                                              "/RenameDeviceScreen",
                                                              "/TestRemoteScreen",
                                                              data);
                                                          // Get.to(() =>
                                                          //     const RenameDeviceScreen());
                                                          // OpenSettings.openIgnoreBackgroundDataRestrictionsSetting();
                                                          // Get.offAll(() => const HomeScreen());
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            bottom: ScreenSize
                                                                .fSize_50(),
                                                            // left: ScreenSize.horizontalBlockSize! * 70,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Container(
                                                              height: ScreenSize
                                                                  .fSize_45(),
                                                              width: ScreenSize
                                                                  .fSize_150(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                // image: const DecorationImage(
                                                                //     image: AssetImage("assets/icons/arrowright.png"),
                                                                //     scale: 1.8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                    ScreenSize
                                                                        .fSize_30(),
                                                                  ),
                                                                ),
                                                                gradient:
                                                                    const LinearGradient(
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment
                                                                      .topCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xFF123F8E),
                                                                    Color(
                                                                        0xFF3092F3),
                                                                  ],
                                                                ),
                                                                // color: Colors.blue,
                                                                // shape: BoxShape.circle,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .blueAccent
                                                                        .shade100,
                                                                    width: 5),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black38,
                                                                      blurRadius:
                                                                          3,
                                                                      offset:
                                                                          Offset(
                                                                              0.5,
                                                                              2)
                                                                      // spreadRadius: 6,
                                                                      // blurStyle: BlurStyle.outer,
                                                                      )
                                                                ],
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Yes",
                                                                  style: GoogleFonts.georama(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          ScreenSize
                                                                              .fSize_17(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
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
                                    },
                                    child: Container(
                                      height: ScreenSize.fSize_60(),
                                      width: ScreenSize.fSize_80(),
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/icons/testbutton.png"),
                                              scale: 1.7),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 2,
                                                offset: Offset(0, 3))
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  ScreenSize.fSize_15())),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF68B1FF),
                                              Color(0xFF1B57AB),
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_20()),
                                  Text(
                                    "Test Remote - 1",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF123F8E)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: ScreenSize.fSize_60(),
                                    width: ScreenSize.fSize_80(),
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/testbutton.png"),
                                            scale: 1.7),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 2,
                                              offset: Offset(0, 3))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_15())),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF68B1FF),
                                            Color(0xFF1B57AB),
                                          ],
                                        )),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_20()),
                                  Text(
                                    "Test Remote - 2",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF123F8E)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_45()),
                          Row(
                            children: [
                              SizedBox(
                                  width: ScreenSize.horizontalBlockSize! * 11),
                              Column(
                                children: [
                                  Container(
                                    height: ScreenSize.fSize_60(),
                                    width: ScreenSize.fSize_80(),
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/testbutton.png"),
                                            scale: 1.7),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 2,
                                              offset: Offset(0, 3))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_15())),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF68B1FF),
                                            Color(0xFF1B57AB),
                                          ],
                                        )),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_20()),
                                  Text(
                                    "Test Remote - 3",
                                    style: GoogleFonts.georama(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF123F8E)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              height: ScreenSize.horizontalBlockSize! * 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/TestRemoteScreen")
          ],
        ),
      ),
    );
  }
}
