// import 'dart:io';
//
// import 'package:file_manager/file_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_gallery/photo_gallery.dart';
// import 'package:screen_mirroring_app/All%20Media%20Screen/Select%20media%20Screen/Select%20Video%20Screen.dart';
// import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
// import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
// import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
// import 'package:transparent_image/transparent_image.dart';
//
// import '../Mediaquery/Media Query.dart';
//
// class SelectVideoScreen extends StatefulWidget {
//   @override
//   _SelectVideoScreenState createState() => _SelectVideoScreenState();
// }
//
// class _SelectVideoScreenState extends State<SelectVideoScreen> {
//   List<Album>? _albums;
//   bool _loading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     initAsync();
//   }
//
//   Future<void> initAsync() async {
//     if (await _promptPermissionSetting()) {
//       List<Album> albums =
//           await PhotoGallery.listAlbums(mediumType: MediumType.video);
//       setState(() {
//         _albums = albums;
//         _loading = false;
//       });
//     }
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   Future<bool> _promptPermissionSetting() async {
//     if (Platform.isIOS &&
//             await Permission.storage.request().isGranted &&
//             await Permission.photos.request().isGranted ||
//         Platform.isAndroid && await Permission.storage.request().isGranted) {
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WillPopScope(
//         onWillPop: () => backButtonController.showAB(context, "/SelectVideoScreen"),
//         child: Scaffold(
//           appBar: customappbar(context, "Screen Mirroring","/SelectVideoScreen"),
//           body: _loading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : LayoutBuilder(
//                   builder: (context, constraints) {
//                     double gridWidth = (constraints.maxWidth - 20) / 3;
//                     double gridHeight = gridWidth + 33;
//                     double ratio = gridWidth / gridHeight;
//                     return GridView.count(
//                       childAspectRatio: ratio,
//                       crossAxisCount: 3,
//                       mainAxisSpacing: 5.0,
//                       crossAxisSpacing: 5.0,
//                       children: [
//                         ...?_albums?.map(
//                           (album) => GestureDetector(
//                             onTap: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (context) => AlbumPage(album))),
//                             child: Column(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Container(
//                                     height: gridWidth,
//                                     width: gridWidth,
//                                     color: Colors.grey[300],
//                                     // height: 100,
//                                     child: FadeInImage(
//                                       fit: BoxFit.cover,
//                                       placeholder: MemoryImage(kTransparentImage),
//                                       image: AlbumThumbnailProvider(
//                                         albumId: album.id,
//                                         mediumType: album.mediumType,
//                                         highQuality: true,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 /*                  Container(
//                                   alignment: Alignment.topLeft,
//                                   padding: EdgeInsets.only(left: 2.0),
//                                   child: Text(
//                                     album.name ?? "Unnamed Album",
//                                     maxLines: 1,
//                                     textAlign: TextAlign.start,
//                                     style: TextStyle(
//                                       height: 1.2,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),*/
//                                 Container(
//                                   child: Text(
//                                     album.count.toString(),
//                                     textAlign: TextAlign.start,
//                                     style: GoogleFonts.georama(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }
