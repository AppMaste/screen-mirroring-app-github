import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Splash%20Screen%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';
import 'package:screen_mirroring_app/Select%20Video%20Screen/Select%20Video%20Screen.dart';
import 'package:screen_mirroring_app/whatsapp%20direct%20screen/Whatsapp%20Direct%20SScreen.dart';

import '../Browser Mirroring/Browser Mirroring Screen.dart';
import '../Remote Controle Screen/Remote Control Screen.dart';
import 'Screen mirroring.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await _showExitBottomSheet(context);
    return exitResult ?? false;
  }

  Future<bool?> _showExitBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenSize.fSize_40()),
              topRight: Radius.circular(ScreenSize.fSize_40()),
            ),
          ),
          child: _buildBottomSheet(context),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          "Do you want to exit this app?",
          style: GoogleFonts.georama(
              fontSize: ScreenSize.horizontalBlockSize! * 5.7,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              // onTap: () {
              //   Get.to(() => Navigator.of(context).pop(true));
              // },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: ScreenSize.fSize_48(),
                  width: ScreenSize.fSize_140(),
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
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xFF00B412),
                        Color(0xFF0D2700),
                      ],
                    ),
                    // color: Colors.blue,
                    // shape: BoxShape.circle,
                    border: Border.all(color: Colors.green.shade400, width: 5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 3,
                          offset: Offset(0.5, 2)
                          // spreadRadius: 6,
                          // blurStyle: BlurStyle.outer,
                          )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "YES",
                      style: GoogleFonts.georama(
                          color: Colors.white,
                          fontSize: ScreenSize.fSize_17(),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              // onTap: () {
              //   Get.to(() => Navigator.of(context).pop(false));
              // },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: ScreenSize.fSize_48(),
                  width: ScreenSize.fSize_140(),
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
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xFFFF0000),
                        Color(0xFF210000),
                      ],
                    ),
                    // color: Colors.blue,
                    // shape: BoxShape.circle,
                    border: Border.all(color: Colors.red.shade400, width: 5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 3,
                          offset: Offset(0.5, 2)
                          // spreadRadius: 6,
                          // blurStyle: BlurStyle.outer,
                          )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "NO",
                      style: GoogleFonts.georama(
                          color: Colors.white,
                          fontSize: ScreenSize.fSize_17(),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          appBar: homescreenappbar(context, "Screen Mirroring"),
          body: Stack(
            children: [
              Container(
                decoration: mainboxdecoration,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                "Screen Mirroring", () {
                              adButtonController.showAB(context,
                                  "/ScreenMirroring", "/HomeScreen", "");
                              // Get.to(() => const ScreenMirroring());
                            }),
                            splash2containerController(
                                context,
                                "assets/icons/browser mirroring icon.png",
                                "Browser Mirroring", () {
                              adButtonController.showAB(context,
                                  "/BrowserMirroringScreen", "/HomeScreen", "");
                              // Get.to(() => const BrowserMirroringScreen());
                            }),
                            splash2containerController(
                                context,
                                "assets/icons/remote-control icon.png",
                                "Remote Control", () {
                              adButtonController.showAB(context,
                                  "/RemoteControlScreen", "/HomeScreen", "");
                              // Get.to(() => const RemoteControlScreen());
                            }),
                            splash2containerController(
                                context,
                                "assets/icons/video player icon.png",
                                "Video Player", () {
                              // FileManager.requestFilesAccessPermission();
                              adButtonController.showAB(context,
                                  "/SelectMediaScreen", "/HomeScreen", "");
                              // Get.to(() => SelectVideoScreen());
                            }),
                            splash2containerController(
                                context,
                                "assets/icons/Whatsapp-direct-icon.png",
                                "WhatsApp Direct", () {
                              adButtonController.showAB(context,
                                  "/WhatsappDirectScreen", "/HomeScreen", "");
                              // Get.to(() => WhatsappDirectScreen());
                            }),
                            SizedBox(height: ScreenSize.fSize_100()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              banner.getBN("/HomeScreen")
            ],
          ),
        ),
      ),
    );
  }
}
