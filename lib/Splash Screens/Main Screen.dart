import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controllers/Main%20App%20Controller.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  AppController myAppController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: ScreenSize.fSize_110()),
              Center(child: Image.asset("assets/logo/logo.png", scale: 3)),
              SizedBox(height: ScreenSize.fSize_80()),
              Text(
                """Screen Mirroring
         Miracast Tv""",
                style: GoogleFonts.georama(
                    fontSize: ScreenSize.fSize_30(),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenSize.horizontalBlockSize! * 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/shapes/Vector 1.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenSize.horizontalBlockSize! * 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/shapes/Vector 2.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenSize.fSize_40(),
              right: ScreenSize.fSize_80(),
              left: ScreenSize.fSize_80(),
            ),
            child:  const Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: ScreenSize.fSize_30()),
        ],
      ),
    );
  }
}
