import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Mediaquery/Media Query.dart';

tvmodelcontroller(BuildContext context, String name, var page) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_70(),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenSize.fSize_15()),
                    bottomLeft: Radius.circular(ScreenSize.fSize_15())),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/icons/screen-mirroring-icon.png",
                    ),
                    scale: 1.8),
              ),
            ),
            // SizedBox(width: ScreenSize.fSize_50()),
            Text(
              textAlign: TextAlign.start,
              name,
              style: GoogleFonts.georama(
                  fontSize: ScreenSize.fSize_20(), fontWeight: FontWeight.w500),
            ),
            const Image(image: AssetImage("assets/icons/arrowright2.png")),
          ],
        ),
      ),
    ),
  );
}

remotecontroller(BuildContext context, String name, var page) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_70(),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenSize.fSize_15()),
                    bottomLeft: Radius.circular(ScreenSize.fSize_15())),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/icons/remote-control icon.png",
                    ),
                    scale: 1.8),
              ),
            ),
            // SizedBox(width: ScreenSize.fSize_50()),
            SizedBox(
              width: ScreenSize.fSize_170(),
              child: Text(
                textAlign: TextAlign.start,
                name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.georama(
                    fontSize: ScreenSize.fSize_20(), fontWeight: FontWeight.w500),
              ),
            ),
            Image(
                image: AssetImage("assets/icons/arrowright2.png"),
                height: ScreenSize.fSize_30()),
          ],
        ),
      ),
    ),
  );
}
