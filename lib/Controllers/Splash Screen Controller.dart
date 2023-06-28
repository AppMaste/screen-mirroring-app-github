import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Home%20Screen/Screen%20mirroring.dart';
import 'package:screen_mirroring_app/whatsapp%20direct%20screen/Whatsapp%20Direct%20SScreen.dart';

import '../Mediaquery/Media Query.dart';

splashController(BuildContext context, String icon, String name) {
  return Container(
    height: ScreenSize.horizontalBlockSize! * 13,
    width: ScreenSize.horizontalBlockSize! * 75,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenSize.fSize_10(),
          ),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 5, offset: Offset(0, 2))
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: ScreenSize.fSize_30()),
        Image(
          image: AssetImage(icon),
          height: ScreenSize.fSize_30(),
        ),
        SizedBox(width: ScreenSize.fSize_20()),
        Text(
          name,
          style: GoogleFonts.georama(
              fontSize: ScreenSize.fSize_17(), fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

splash2Controller(BuildContext context, String icon, String name) {
  return Container(
    height: ScreenSize.horizontalBlockSize! * 14,
    width: ScreenSize.horizontalBlockSize! * 80,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.all(Radius.circular(
          ScreenSize.fSize_10(),
        )),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(1, 2),
            blurRadius: 5,
          ),
        ]),
    child: Row(
      children: [
        SizedBox(width: ScreenSize.fSize_24()),
        Image(
          image: AssetImage(icon),
          height: ScreenSize.fSize_45(),
        ),
        SizedBox(width: ScreenSize.fSize_20()),
        Text(
          name,
          style: GoogleFonts.georama(
              fontSize: ScreenSize.fSize_17(), fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

splash2containerController(BuildContext context, String icon, String name,var page) {
  return GestureDetector(
    onTap: page,
    child: Padding(
      padding: EdgeInsets.all(ScreenSize.fSize_15()),
      child: Container(
        height: ScreenSize.fSize_50(),
        // width: ScreenSize.horizontalBlockSize! * 75,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 5,
                offset: Offset(1, 2),
              )
            ],
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenSize.fSize_15()))),
        child: Row(
          children: [
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_70(),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenSize.fSize_15()),
                    bottomLeft: Radius.circular(ScreenSize.fSize_15())),
                image: DecorationImage(image: AssetImage(icon), scale: 1.8),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_50()),
            Text(
              name,
              style: GoogleFonts.georama(
                  fontSize: ScreenSize.fSize_20(), fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ),
  );
}
splashhhhh2containerController(BuildContext context, String icon, String name,var page) {
  return  GestureDetector(
    onTap: page,
    child: Padding(
      padding: EdgeInsets.all(ScreenSize.fSize_15()),
      child: Container(
        height: ScreenSize.fSize_50(),
        // width: ScreenSize.horizontalBlockSize! * 75,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 5,
                offset: Offset(1, 2),
              )
            ],
            color: Colors.white,
            borderRadius:
            BorderRadius.all(Radius.circular(ScreenSize.fSize_15()))),
        child: Row(
          children: [
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_70(),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenSize.fSize_15()),
                    bottomLeft: Radius.circular(ScreenSize.fSize_15())),
                image: DecorationImage(image: AssetImage(icon), scale: 1.8),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_55()),
            Text(
              textAlign: TextAlign.center,
              name,
              style: GoogleFonts.georama(
                  fontSize: ScreenSize.fSize_20(), fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ),
  );
}

rowContainerController(BuildContext context, var gcolor1, var gcolor2) {
  return Container(
    height: ScreenSize.horizontalBlockSize! * 3,
    width: ScreenSize.horizontalBlockSize! * 10,
    decoration: BoxDecoration(
      // color: color,
      borderRadius: BorderRadius.all(Radius.circular(ScreenSize.fSize_20())),
      gradient: LinearGradient(
        colors: [
          gcolor1,
          gcolor2,
        ],
      ),
    ),
  );
}




