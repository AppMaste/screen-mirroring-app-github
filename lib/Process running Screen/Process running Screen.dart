import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Process%20running%20Screen/Process%20Complete%20Screen.dart';

import '../Mediaquery/Media Query.dart';
class ProcessRunningScreen extends StatefulWidget {
  const ProcessRunningScreen({Key? key}) : super(key: key);

  @override
  State<ProcessRunningScreen> createState() => _ProcessRunningScreenState();
}

// ignore: camel_case_types
class _ProcessRunningScreenState extends State<ProcessRunningScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOutBack);
  late AnimationController checkController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.easeInOutBack);

//================================================================================================================
  late AnimationController scaleController1 =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation1 =
      CurvedAnimation(parent: scaleController1, curve: Curves.easeInOutBack);
  late AnimationController checkController1 =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> checkAnimation1 =
      CurvedAnimation(parent: checkController1, curve: Curves.easeInOutBack);

//================================================================================================================
  late AnimationController scaleController2 =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation2 =
      CurvedAnimation(parent: scaleController2, curve: Curves.easeInOutBack);
  late AnimationController checkController2 =
      AnimationController(duration: const Duration(seconds: 4), vsync: this);
  late Animation<double> checkAnimation2 =
      CurvedAnimation(parent: checkController2, curve: Curves.easeInOutBack);

//================================================================================================================
  late AnimationController scaleController3 =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation3 =
      CurvedAnimation(parent: scaleController3, curve: Curves.easeInOutBack);
  late AnimationController checkController3 =
      AnimationController(duration: const Duration(seconds: 5), vsync: this);
  late Animation<double> checkAnimation3 =
      CurvedAnimation(parent: checkController3, curve: Curves.easeInOutBack);

  //================================================================================================================
  late AnimationController nextscaleController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> nextscaleAnimation =
      CurvedAnimation(parent: nextscaleController, curve: Curves.linearToEaseOut);
  late AnimationController nextcheckController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> nextcheckAnimation =
      CurvedAnimation(parent: nextcheckController, curve: Curves.linearToEaseOut);

  //===================================================================================================================
  late AnimationController imagescaleController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> imageAnimtion =
      CurvedAnimation(parent: imagescaleController, curve: Curves.linearToEaseOut);
  late AnimationController imagecheckController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> imagecheckAnimation =
      CurvedAnimation(parent: imagecheckController, curve: Curves.linearToEaseOut);

  bool timer = false;
  bool timer2 = false;

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController1.forward();
      }
    });
    scaleController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController2.forward();
      }
    });
    scaleController3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController3.forward();
      }
    });
    nextscaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextcheckController.forward();
      }
    });

    scaleController.forward();
    scaleController1.forward();
    scaleController2.forward();
    scaleController3.forward();
    nextscaleController.forward();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          timer = true;
        });
      },
    );
    Future.delayed(
      Duration(seconds: 3),
      () {
        setState(() {
          timer2 = true;
        });
      },
    );
  }

  button() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Progress Running',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenSize.fSize_20())),
            JumpingDotsProgressIndicator(
              fontSize: 30.0,
            ),
          ],
        ),
        Center(
          child: Text('Please Wait...',
              style: GoogleFonts.georama(
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenSize.fSize_15())),
        ),
      ],
    );
  }

  imageview() {
    return Image.asset("assets/images/process running image.png",
        height: ScreenSize.horizontalBlockSize! * 60);
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    scaleController1.dispose();
    checkController1.dispose();
    scaleController2.dispose();
    checkController2.dispose();
    scaleController3.dispose();
    checkController3.dispose();
    nextscaleController.dispose();
    nextcheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);

    var animationtextstyle = GoogleFonts.georama(
      fontWeight: FontWeight.w600,
      fontSize: ScreenSize.fSize_15(),
      color: timer ? Color(0xFF123F8E) : Colors.black,
    );

    double circleSize = ScreenSize.fSize_18();
    double iconSize = ScreenSize.fSize_14();
    return WillPopScope(
      onWillPop: () =>
          backButtonController.showAB(context, '/ProcessRunningScreen'),
      child: Scaffold(
        appBar:
            customappbar(context, "Screen Mirroring", "/ProcessRunningScreen"),
        // appBar: controllerapp.getbar(() {
        //   backbuttoncontroller.showBackbuttonad(
        //       context, '/progress_running_screen');
        // }, 'Cast To TV', true),
        body: Stack(
          children: [
            Container(
              decoration: mainboxdecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        if (timer2 == true) ...[
                          ScaleTransition(
                            scale: nextcheckAnimation,
                            child: Image(
                                height:
                                    ScreenSize.horizontalBlockSize! * 60,
                                image: const AssetImage(
                                    'assets/images/process complete image.png')),
                          )
                        ] else ...[
                          imageview(),
                        ],
                        // ScaleTransition(
                        //   scale: nextcheckAnimation,
                        //   child: Image(
                        //       height:
                        //           ScreenSize.horizontalBlockSize! * 60,
                        //       image: const AssetImage(
                        //           'assets/images/process complete image.png')),
                        // ),
                      ],
                    ),

                    // ScaleTransition(
                    //   scale: nextcheckAnimation,
                    //   child: Image(
                    //       height: ScreenSize.horizontalBlockSize! * 60,
                    //       image: const AssetImage(
                    //           'assets/images/process complete image.png')),
                    // ),
                    Container(
                      height: ScreenSize.horizontalBlockSize! * 130,
                      decoration: boxdecoration,
                      child: Column(children: [
                        SizedBox(height: ScreenSize.fSize_50()),
                        Center(
                          child: ScaleTransition(
                            scale: nextcheckAnimation,
                            child: Text('Progress Complete',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: ScreenSize.fSize_20())),
                          ),
                        ),
                        if (timer) ...[
                          Container()
                        ] else ...[
                          button(),
                        ],
                        SizedBox(height: ScreenSize.fSize_40()),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_40()),
                            Stack(
                              children: [
                                Center(
                                  child: ScaleTransition(
                                    scale: scaleAnimation,
                                    child: Container(
                                      height: circleSize,
                                      width: circleSize,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizeTransition(
                                  sizeFactor: checkAnimation,
                                  axis: Axis.horizontal,
                                  axisAlignment: -1,
                                  child: Center(
                                    child: Container(
                                        height: circleSize,
                                        width: circleSize,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.check,
                                            color: Colors.white,
                                            size: iconSize)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: ScreenSize.fSize_20()),
                            Text(
                              'Scanning for TVs',
                              style: animationtextstyle,
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_40()),
                            Stack(
                              children: [
                                Center(
                                  child: ScaleTransition(
                                    scale: scaleAnimation1,
                                    child: Container(
                                      height: circleSize,
                                      width: circleSize,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizeTransition(
                                  sizeFactor: checkAnimation1,
                                  axis: Axis.horizontal,
                                  axisAlignment: -1,
                                  child: Center(
                                    child: Container(
                                        height: circleSize,
                                        width: circleSize,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.check,
                                            color: Colors.white,
                                            size: iconSize)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: ScreenSize.fSize_20()),
                            Text(
                              'Detecting Model',
                              style: animationtextstyle,
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_40()),
                            Stack(
                              children: [
                                Center(
                                  child: ScaleTransition(
                                    scale: scaleAnimation2,
                                    child: Container(
                                      height: circleSize,
                                      width: circleSize,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizeTransition(
                                  sizeFactor: checkAnimation2,
                                  axis: Axis.horizontal,
                                  axisAlignment: -1,
                                  child: Center(
                                    child: Container(
                                        height: circleSize,
                                        width: circleSize,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.check,
                                            color: Colors.white,
                                            size: iconSize)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: ScreenSize.fSize_20()),
                            Text(
                              'Installing Drivers',
                              style: animationtextstyle,
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_40()),
                            Stack(
                              children: [
                                Center(
                                  child: ScaleTransition(
                                    scale: scaleAnimation3,
                                    child: Container(
                                      height: circleSize,
                                      width: circleSize,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizeTransition(
                                  sizeFactor: checkAnimation3,
                                  axis: Axis.horizontal,
                                  axisAlignment: -1,
                                  child: Center(
                                    child: Container(
                                        height: circleSize,
                                        width: circleSize,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.check,
                                            color: Colors.white,
                                            size: iconSize)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: ScreenSize.fSize_20()),
                            Text(
                              'Connecting',
                              style: animationtextstyle,
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_60()),
//================================================================next button =================================================================
                        Stack(
                          children: [
                            Center(
                              child: ScaleTransition(
                                scale: nextcheckAnimation,
                                child: GestureDetector(
                                  onTap: () {
                                    adButtonController.showAB(
                                        context,
                                        "/PhonesScreenToTVScreen",
                                        "/ProcessRunningScreen",
                                        "");
                                    // Get.to(() => const ProcessRunningScreen());
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
                                            "NEXT",
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
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN("/ProcessRunningScreen")
          ],
        ),
      ),
    );
  }
}
