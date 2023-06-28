import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controller.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Controllers.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Tv%20Remote%20Control%20Screen/TV%20Remote%20Control%20Screen.dart';

import '../Mediaquery/Media Query.dart';

class SaveRemoteScreen extends StatelessWidget {
  const SaveRemoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backButtonController.showAB(context, "/SaveRemoteScreen"),
      child: Scaffold(
        appBar: customappbar(context, "TV Remote Control", "/SaveRemoteScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      width: double.infinity,
                      decoration: boxdecoration,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_30()),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: remoteController.itemcount.value,
                            itemBuilder: (context, index) {
                          return remotecontroller(context,
                              remoteController.acname.value[index].name, () {
                            adButtonController.showAB(
                                context,
                                "/TVRemoteControlScreen",
                                "/SaveRemoteScreen",
                                remoteController.acname.value[index].name);
                            // const TVRemoteControlScreen();
                          });
                            },
                          ),
                          // remotecontroller(context, "Acer TV", () {
                          //   adButtonController.showAB(context,
                          //       "/TVRemoteControlScreen", "/SaveRemoteScreen", "");
                          //   // const TVRemoteControlScreen();
                          // }),
                          // remotecontroller(context, "LG TV", () {
                          //   adButtonController.showAB(context,
                          //       "/TVRemoteControlScreen", "/SaveRemoteScreen", "");
                          //   // const TVRemoteControlScreen();
                          // }),
                          SizedBox(height: ScreenSize.fSize_60()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/SaveRemoteScreen")
          ],
        ),
      ),
    );
  }
}
