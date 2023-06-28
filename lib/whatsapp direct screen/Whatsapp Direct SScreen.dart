import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Mediaquery/Media Query.dart';

class WhatsappDirectScreen extends StatefulWidget {
  WhatsappDirectScreen({Key? key}) : super(key: key);

  @override
  State<WhatsappDirectScreen> createState() => _WhatsappDirectScreenState();
}

class _WhatsappDirectScreenState extends State<WhatsappDirectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number.clear();
    message.clear();
    country.clear();
  }

  TextEditingController number = TextEditingController();

  TextEditingController message = TextEditingController();

  TextEditingController country = TextEditingController();

  final Uri phonenumber = Uri.parse("tel:+1-555-010-999");

  @override
  Widget build(BuildContext context) {
    // var whatsappUrl =
    //     "whatsapp://send?phone=" + (number.text) + "&text=$message";

    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/WhatsappDirectScreen"),
      child: Scaffold(
        appBar: customappbar(context, "","/WhatsappDirectScreen"),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF235fc3),
                Color(0xFF5d89d4),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: ScreenSize.fSize_30()),
                Image(
                  image: const AssetImage("assets/images/4042177 1.png"),
                  height: ScreenSize.fSize_170(),
                ),
                SizedBox(height: ScreenSize.fSize_30()),
                Container(
                  width: double.infinity,
                  decoration: boxdecoration,
                  child: Column(
                    children: [
                      SizedBox(height: ScreenSize.fSize_30()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: ScreenSize.fSize_55(),
                            width: ScreenSize.horizontalBlockSize! * 37,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.fSize_15())),
                            /*          child: IntlPhoneField(
                              controller: country,
                              initialCountryCode: "IN",
                              disableLengthCheck: true,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                isDense: false,
                                enabled: false,
                                fillColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              ),
                            ),*/
                            child: const CountryCodePicker(
                              showDropDownButton: false,
                              showFlagDialog: true,
                              onChanged: print,
                              initialSelection: 'IN',
                              favorite: ['+91', 'IN'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                          ),
                          Container(
                            height: ScreenSize.fSize_55(),
                            width: ScreenSize.horizontalBlockSize! * 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.fSize_15())),
                            child: Row(
                              children: [
                                SizedBox(width: ScreenSize.fSize_10()),
                                Image(
                                  image: const AssetImage(
                                      "assets/icons/cell-phone 1.png"),
                                  height: ScreenSize.fSize_30(),
                                ),
                                Flexible(
                                  child: TextField(
                                    controller: number,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mobile Number",
                                        hintStyle: GoogleFonts.georama(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: ScreenSize.fSize_150(),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(ScreenSize.fSize_15())),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: message,
                              maxLines: null,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  border: InputBorder.none,
                                  hintText: "Enter Message",
                                  hintStyle: GoogleFonts.georama(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
                      GestureDetector(
                        onTap: () {
                          WhatApplaunch();
                          // WhatApplaunch(
                          //     number: "+91${number.text}",
                          //     message: message.text);
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
                                  "Send",
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
                    ],
                  ),
                ),
                banner.getBN("/WhatsappDirectScreen")
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  WhatApplaunch() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var whatsappUrl = "whatsapp://send?phone= ${number.text}"
        "&text=${message.text}";
    var not = "https://www.whatsapp.com/";
    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl));
      } else {
        if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
          await launchUrl(Uri.parse(whatsappUrl));
        } else {
          launchUrl(Uri.parse(not));
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text("Whatsapp not installed")));
        }
      }
    }
  }
}
