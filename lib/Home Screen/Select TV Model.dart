import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';

import '../Controllers/Controllers.dart';
import '../Controllers/Splash Screen Controller.dart';
import '../Mediaquery/Media Query.dart';
import 'Screen mirroring.dart';
import 'Select TV Model Year Screen.dart';

class TVModelScreen extends StatelessWidget {
  const TVModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/TVModelScreen"),
      child: Scaffold(
        appBar: customappbar(context, "Select TV Model","/TVModelScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Image(
                      image: const AssetImage("assets/images/20945302 1.png"),
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
                          tvmodelcontroller(context, "Sony", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          tvmodelcontroller(context, "Samsung", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          tvmodelcontroller(context, "LG", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          tvmodelcontroller(context, "Panasonic", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          tvmodelcontroller(context, "Mi", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          tvmodelcontroller(context, "One Plus TCL", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          tvmodelcontroller(context, "Other", () {
                            adButtonController.showAB(
                                context,
                                "/SelectTVModelYearScreen",
                                "/TVModelScreen",
                                "");
                            // const SelectTVModelYearScreen();
                          }),
                          SizedBox(height: ScreenSize.fSize_100()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/TVModelScreen")
          ],
        ),
      ),
    );
  }
}
