import 'package:file_manager/file_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/demo%20Page.dart';

import '../Controllers/Splash Screen Controller.dart';
import '../Mediaquery/Media Query.dart';
import '../Select Video Screen/Select Video Screen.dart';

class AllMediaScreen extends StatefulWidget {
  const AllMediaScreen({Key? key}) : super(key: key);

  @override
  State<AllMediaScreen> createState() => _AllMediaScreenState();
}

class _AllMediaScreenState extends State<AllMediaScreen> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //     FileManager.requestFilesAccessPermission();
  //
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/AllMediaScreen"),
      child: Scaffold(
        appBar: customappbar(context, "Screen Mirroring", "/AllMediaScreen"),
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
                          splashhhhh2containerController(
                              context, "assets/icons/video.png", "All Videos",
                              () async {
                            FileManager.requestFilesAccessPermission();
                            adButtonController.showAB(context,
                                "/SelectMediaScreen", "/AllMediaScreen", "");
                            // Get.to(() => SelectVideoScreen());
                            // FilePickerResult? result = await FilePicker.platform
                            //     .pickFiles(type: FileType.video);
                          }),
                          splashhhhh2containerController(
                              context, "assets/icons/image.png", "Images", () {
                            adButtonController.showAB(context,
                                "/SelectImageScreen", "/AllMediaScreen", "");
                            // Get.to(() => SelectVideoScreen());
                            FileManager.requestFilesAccessPermission();
                            // FilePickerResult? result = await FilePicker.platform
                            //     .pickFiles(type: FileType.image);
                          }),
                          splashhhhh2containerController(
                              context, "assets/icons/audio.png", "Audio",
                              () async {
                            // FileManager.requestFilesAccessPermission();
                            adButtonController.showAB(context,
                                "/AudioPickScreen", "/AllMediaScreen", "");
                            // Get.to(() => SelectVideoScreen());
                            // FilePickerResult? result = await FilePicker.platform
                            //     .pickFiles(type: FileType.audio);
                            // Get.to(()=> DemoPage());
                          }),
                          SizedBox(height: ScreenSize.fSize_20()),
                          // native.getNT("listTileMedium"),
                          SizedBox(height: ScreenSize.fSize_60()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/AllMediaScreen")
          ],
        ),
      ),
    );
  }
}
