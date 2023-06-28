import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';
import 'package:screen_mirroring_app/Browser%20Mirroring/Browser%20Mirroring%20Screen.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Remote%20Controle%20Screen/Remote%20Control%20Screen.dart';
import 'package:screen_mirroring_app/Select%20Video%20Screen/Select%20Video%20Screen.dart';
import 'package:screen_mirroring_app/whatsapp%20direct%20screen/Whatsapp%20Direct%20SScreen.dart';

import '../Controllers/Splash Screen Controller.dart';
import '../Mediaquery/Media Query.dart';
import '../Screen Mirroring Detail/detail.dart';

class PhonesScreenToTVScreen extends StatelessWidget {
  const PhonesScreenToTVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backButtonController.showAB(context, "/PhonesScreenToTVScreen"),
      child: Scaffold(
        appBar: phonescreenappbar(context, "Screen Mirroring"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(
                        "assets/images/screen mirroring image.png",
                      ),
                      height: ScreenSize.fSize_120(),
                    ),
                    SizedBox(height: ScreenSize.fSize_30()),
                    Container(
                      width: double.infinity,
                      decoration:boxdecoration,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_30()),
                          GestureDetector(
                            onTap: () {
                              OpenSettings.openCastSetting();
                              // Get.to(()=> ScreenMirroringDetail());
                            },
                            child: Container(
                              height: ScreenSize.fSize_70(),
                              width: ScreenSize.horizontalBlockSize! * 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_15())),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xFF1B57AB),
                                    Color(0xFF68B1FF),
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        "assets/icons/screen.png"),
                                    height: ScreenSize.fSize_45(),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Screen Mirroring",
                                        style: GoogleFonts.georama(
                                            fontSize: ScreenSize
                                                    .horizontalBlockSize! *
                                                5.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Mirror phone’s screen to TV",
                                        style: GoogleFonts.georama(
                                            fontSize: ScreenSize.fSize_15(),
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  Image(
                                    image: const AssetImage(
                                        "assets/icons/arrowright.png"),
                                    height: ScreenSize.fSize_30(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_30()),
                          native.getNT("listTile","/PhonesScreenToTVScreen"),
                          SizedBox(height: ScreenSize.fSize_30()),
                          splash2containerController(
                              context,
                              "assets/icons/remote-control icon.png",
                              "Remote Control", () {
                            adButtonController.showAB(
                                context,
                                "/RemoteControlScreen",
                                "/PhonesScreenToTVScreen",
                                "");
                            // Get.to(() => const RemoteControlScreen());
                          }),
                          splash2containerController(
                              context,
                              "assets/icons/video player icon.png",
                              "Video Player", () {
                            adButtonController.showAB(
                                context,
                                "/SelectMediaScreen",
                                "/PhonesScreenToTVScreen",
                                "");
                            // Get.to(() => SelectVideoScreen());
                          }),
                          splash2containerController(
                              context,
                              "assets/icons/browser mirroring icon.png",
                              "Browser Mirroring", () {
                            adButtonController.showAB(
                                context,
                                "/BrowserMirroringScreen",
                                "/PhonesScreenToTVScreen",
                                "");
                            // Get.to(() => const BrowserMirroringScreen());
                          }),
                          splash2containerController(
                              context,
                              "assets/icons/Whatsapp-direct-icon.png",
                              "WhatsApp Direct", () {
                            adButtonController.showAB(
                                context,
                                "/WhatsappDirectScreen",
                                "/PhonesScreenToTVScreen",
                                "");
                            // Get.to(() => WhatsappDirectScreen());
                          }),
                          SizedBox(height: ScreenSize.fSize_100()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            banner.getBN("/PhonesScreenToTVScreen")
          ],
        ),
      ),
    );
  }
}
