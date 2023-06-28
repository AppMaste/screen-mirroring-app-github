import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllers/Button Ad Controller.dart';
import '../Mediaquery/Media Query.dart';

var browsertext = "http://192.168.1.9:8080";


var mainboxdecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF235fc3),
      Color(0xFF5d89d4),
    ],
  ),
);

var boxdecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFabc2e9),
        Color(0xFFeff4fe),
      ],
    ),
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(ScreenSize.fSize_20()),
        topLeft: Radius.circular(ScreenSize.fSize_20())));

List title = [
  "Acer",
  "Admiral",
  "Aiwa",
  "Akai",
  "Apex",
  "Audiovox",
  "Bose",
  "Bush",
  "Changhong",
  "Coby",
  "Colby",
  "Condor",
  "Zenith",
  "Dura Brand",
  "Dynex",
  "Element",
  "Emerson",
  "Funai",
  "Haier",
  "Hisense",
  "Hitachi",
  "Hyundai",
  "Insignia",
  "Jensen",
  "Kenwood",
  "LG",
  "Logik",
  "Magnavox",
  "Mascom",
  "Medion",
  "Micromax",
  "Mitsubishi",
  "Mystery",
  "NEC",
  "Nexus",
  "Nikai",
  "Noblex",
  "Olevia",
  "Onida",
  "Orion",
  "Palsonic",
  "Panasonic",
  "Philco",
  "Philips",
  "Pioneer",
  "Polaroid",
  "Polytron",
  "Prima",
  "Promac",
  "Proscan",
  "Proton",
  "Rubin",
  "Samsung",
  "Samsung Smart",
  "Sansui",
  "Sanyo",
  "Scott",
  "Seiki",
  "Sharp",
  "Singer",
  "Sinotec",
  "Skyworth",
  "Sony",
  "Supra",
  "Swisstec",
  "Sylvania",
  "Symphonic",
  "TCL",
  "Technical",
  "Thomson",
  "Tokai",
  "Toshiba",
  "TurboX",
  "Upstar",
  "Venturer",
  "Veon",
  "Videocon",
  "Viore",
  "Vizio",
  "Voxson",
  "Westinghouse",
  "Multi TV",
  "SFR",
  "Start Times",
  "Total Play",
  "Trend",
];

demotext(BuildContext context, String text) {
  return Text(
    text,
    style: GoogleFonts.georama(
        color: const Color(0xFF5A3B8B),
        fontWeight: FontWeight.w500,
        fontSize: ScreenSize.fSize_20()),
  );
}

customappbar(BuildContext context, String name, String pagename) {
  return AppBar(
    leadingWidth: ScreenSize.fSize_50(),
    leading: GestureDetector(
      onTap: () {
        // Get.back();
        backButtonController.showAB(context, pagename);
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage("assets/icons/arrowsquareleft.png"),
        ),
      ),
    ),
    elevation: 0,
    title: Text(
      name,
      style: GoogleFonts.georama(
          fontSize: ScreenSize.fSize_20(),
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    backgroundColor: const Color(0xFF235fc3),
  );
}

homescreenappbar(BuildContext context, String name) {
  return AppBar(
    leading: SizedBox(),
    elevation: 0,
    title: Text(
      name,
      style: GoogleFonts.georama(
          fontSize: ScreenSize.fSize_20(),
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    backgroundColor: const Color(0xFF235fc3),
  );
}

phonescreenappbar(BuildContext context, String name) {
  return AppBar(
    leadingWidth: ScreenSize.fSize_50(),
    actions: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            adButtonController.showAB(context, "/ScreenMirroringDetail",
                "/PhonesScreenToTVScreen", "");
          },
          child: Image(
            image: AssetImage("assets/icons/information.png"),
          ),
        ),
      ),
    ],
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage("assets/icons/arrowsquareleft.png"),
        ),
      ),
    ),
    elevation: 0,
    title: Text(
      name,
      style: GoogleFonts.georama(
          fontSize: ScreenSize.fSize_20(),
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    backgroundColor: const Color(0xFF235fc3),
  );
}
