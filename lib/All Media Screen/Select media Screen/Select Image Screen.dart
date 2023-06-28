import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';
import 'package:transparent_image/transparent_image.dart';

import 'Select Video Screen.dart';

class SelectImageScreen extends StatefulWidget {
  SelectImageScreen({super.key});

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  List<Album>? _albums;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums =
          await PhotoGallery.listAlbums(mediumType: MediumType.image);
      setState(() {
        _albums = albums;
        _loading = false;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      appBar: customappbar(context, "Images", "/SelectImageScreen"),
      body: Stack(
        children: [
          _loading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : LayoutBuilder(
            builder: (context, constraints) {
              double gridWidth = (constraints.maxWidth - 20) / 3;
              double gridHeight = gridWidth + 33;
              double ratio = gridWidth / gridHeight;
              return Container(
                padding: EdgeInsets.all(5),
                child: ListView.custom(
                  // childAspectRatio: ratio,
                  // crossAxisCount: 3,
                  // mainAxisSpacing: 5.0,
                  // crossAxisSpacing: 5.0,
                    childrenDelegate: SliverChildListDelegate([
                      ...?_albums?.map(
                            (album) => GestureDetector(
                              onTap: (){
                                adButtonController.showAB(context, "/AlbumPage", "/SelectImageScreen", album);
                              },
                          // onTap: () => Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) => AlbumPage(album))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: ScreenSize.fSize_55(),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: ScreenSize.fSize_50(),
                                      width: ScreenSize.fSize_50(),
                                      color: Colors.grey[300],
                                      // height: 100,
                                      child: const Image(
                                          image: AssetImage(
                                              "assets/icons/File manager.jpg")),
                                      /*        child: FadeInImage(
                                      fit: BoxFit.cover,
                                      placeholder:
                                        MemoryImage(kTransparentImage),
                                      image: AlbumThumbnailProvider(
                                      albumId: album.id,
                                      mediumType: album.mediumType,
                                      highQuality: true,
                                      ),
                                    ),*/
                                    ),
                                    Text(
                                      album.name ?? "Unnamed Album",
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.georama(
                                          height: 1.2,
                                          fontSize: ScreenSize.fSize_15(),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      album.count.toString(),
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.georama(
                                          fontSize: ScreenSize.fSize_15(),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])),
              );
            },
          ),
          banner.getBN("/SelectImageScreen")
        ],
      )

    );
  }
}
