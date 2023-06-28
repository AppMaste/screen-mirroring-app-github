import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controller.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';


import '../Mediaquery/Media Query.dart';
import '../Tv Remote Control Screen/TV Remote Control Screen.dart';

var indexs =  0;
class RenameDeviceScreen extends StatelessWidget {
  RenameDeviceScreen({Key? key}) : super(key: key);

  var detail = Get.arguments;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: detail.toString());
    return WillPopScope(
      onWillPop: () =>
          backButtonController.showAB(context, "/RenameDeviceScreen"),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customappbar(context, "Save TV Remote","/RenameDeviceScreen"),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration:boxdecoration,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_45()),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              Text(
                                "Rename Device Name :",
                                style: GoogleFonts.georama(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: ScreenSize.fSize_15()),
                              ),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Container(
                            height: ScreenSize.fSize_50(),
                            width: ScreenSize.fSize_275(),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 3,
                                      offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.fSize_10())),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  // helperText: "$detail",
                                  border: InputBorder.none,
                                  // hintText: "$detail",

                                  // hintText: "$detail",
                                  // helperStyle: GoogleFonts.georama(
                                  //   color: Colors.black,
                                  //   fontWeight: FontWeight.w500,
                                  //   fontSize: ScreenSize.fSize_18(),
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_60()),
                          GestureDetector(
                            onTap: () {
                              remoteController.adremote(
                                  nameController.text,
                                  remoteController
                                      .searchcontroller.text);
                              if (nameController.text.isNotEmpty) {
                                adButtonController.showAB(
                                    context,
                                    "/TVRemoteControlScreen",
                                    "/RenameDeviceScreen",
                                    (nameController.text));
                              } else {
                                adButtonController.showAB(
                                    context,
                                    "/TVRemoteControlScreen",
                                    "/RenameDeviceScreen",
                                    detail);
                              }
                              // Get.to(()=> const TVRemoteControlScreen());
                              // Get.offAll(() => const HomeScreen());
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
                                      "Save",
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
                          SizedBox(
                              height: ScreenSize.horizontalBlockSize! * 150),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            banner.getBN("/RenameDeviceScreen")
          ],
        ),
      ),
    );
  }
}
