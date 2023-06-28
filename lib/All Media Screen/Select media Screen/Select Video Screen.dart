import 'dart:async';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:screen_mirroring_app/Controller.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

class SelectMediaScreen extends StatefulWidget {
  @override
  SelectMediaScreenState createState() => SelectMediaScreenState();
}

class SelectMediaScreenState extends State<SelectMediaScreen> {
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
          await PhotoGallery.listAlbums(mediumType: MediumType.video);
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
    return Scaffold(
        appBar: customappbar(context, "Video Player", "/SelectMediaScreen"),
        body: Stack(
          children: [
            _loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      double gridWidth = (constraints.maxWidth - 20) / 3;
                      double gridHeight = gridWidth + 33;
                      double ratio = gridWidth / gridHeight;
                      return ListView.custom(
                          // childAspectRatio: ratio,
                          // crossAxisCount: 3,
                          // mainAxisSpacing: 5.0,
                          // crossAxisSpacing: 5.0,
                          childrenDelegate: SliverChildListDelegate([
                        ...?_albums?.map(
                          (album) => GestureDetector(
                            onTap: () {
                              adButtonController.showAB(context, "/AlbumPage",
                                  "/SelectMediaScreen", album);
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            ScreenSize.fSize_50()),
                                        child: Container(
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
                      ]));
                    },
                  ),
            banner.getBN("/SelectMediaScreen"),
          ],
        ));
  }
}

class AlbumPage extends StatefulWidget {
  AlbumPage({super.key});

  @override
  State<StatefulWidget> createState() => AlbumPageState();

  var data = Get.arguments;
}

class AlbumPageState extends State<AlbumPage> {
  List<Medium>? _media;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    MediaPage mediaPage = await widget.data.listMedia();
    setState(() {
      _media = mediaPage.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/AlbumPage"),
      child: Scaffold(
        appBar:
            customappbar(context, "${widget.data.name}", "/SelectMediaScreen"),
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        //   title: Text(widget.album.name ?? "Unnamed Album"),
        // ),
        body: Stack(
          children: [
            Container(
              child: ListView.custom(
                shrinkWrap: true,
                // crossAxisCount: 3,
                // mainAxisSpacing: 1.0,
                // crossAxisSpacing: 1.0,
                childrenDelegate: SliverChildListDelegate(
                  [
                    ...?_media?.map(
                      (medium) => GestureDetector(
                        onTap: () {
                          adButtonController.showAB(
                              context, "/ViewerPage", "/AlbumPage", medium);
                        },
                        // onTap: () => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => ViewerPage(medium))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: ScreenSize.fSize_55(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.fSize_10()),
                                color: Colors.grey[300],
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: ScreenSize.fSize_55(),
                                    width: ScreenSize.fSize_55(),
                                    child: FadeInImage(
                                      fit: BoxFit.cover,
                                      placeholder:
                                          MemoryImage(kTransparentImage),
                                      image: ThumbnailProvider(
                                        mediumId: medium.id,
                                        mediumType: medium.mediumType,
                                        highQuality: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: ScreenSize.fSize_20()),
                                  Text(
                                    medium.filename.toString(),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.georama(
                                        height: 1.2,
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
                  ],
                ),
              ),
            ),
            banner.getBN("/AlbumPage"),
          ],
        ),
      ),
    );
  }
}

class ViewerPage extends StatefulWidget {
  ViewerPage({super.key});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Medium viewdata = Get.arguments;

  @override
  Widget build(BuildContext context) {
    DateTime? date = viewdata.creationDate ?? viewdata.modifiedDate;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () => backButtonController.showAB(context, "/ViewerPage"),
        child: Scaffold(
          appBar:
              customappbar(context, "${viewdata.title}", "/SelectMediaScreen"),
          // appBar: AppBar(
          //   leading: IconButton(
          //     onPressed: () => Navigator.of(context).pop(),
          //     icon: Icon(Icons.arrow_back_ios),
          //   ),
          //   // title: date != null ? Text(date.toLocal().toString()) : null,
          // ),
          body: Container(
            alignment: Alignment.center,
            child: viewdata.mediumType == MediumType.image
                ? FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: PhotoProvider(mediumId: viewdata.id),
                  )
                : VideoProvider(mediumId: viewdata.id),
          ),
        ),
      ),
    );
  }
}

class VideoProvider extends StatefulWidget {
  final String mediumId;

  const VideoProvider({
    required this.mediumId,
  });

  @override
  _VideoProviderState createState() => _VideoProviderState();
}

class _VideoProviderState extends State<VideoProvider> {
  VideoPlayerController? _controller;
  File? _file;
  ChewieController? chewieController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
    chewieController!.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAsync();
    });
    super.initState();
  }

  Future<void> initAsync() async {
    try {
      _file = await PhotoGallery.getFile(mediumId: widget.mediumId);
      _controller = VideoPlayerController.file(_file!);
      _controller?.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        chewieController = ChewieController(
            videoPlayerController: _controller!,
            autoPlay: true,
            looping: false,
            materialProgressColors: ChewieProgressColors(
                // playedColor: Colors.red,
                // handleColor: Colors.cyanAccent,
                // backgroundColor: Colors.yellow,
                // bufferedColor: Colors.lightGreen,
                ),
            placeholder: Container(
              color: Colors.greenAccent,
            ),
            autoInitialize: true);
      });
      chewieController?.addListener(() {});
    } catch (e) {
      print("Failed : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("fileeee $_file");

    return WillPopScope(
      onWillPop: () => backButtonController.showAB(context, "/VideoProvider"),
      child: Scaffold(
        body: !chewieController!.isPlaying
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: Chewie(
                        controller: chewieController!,
                        // mediumId: widget.medium.id,
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_10()),
                    /*GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller!.value.isPlaying
                            ? _controller!.pause()
                            : _controller!.play();
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF235fc3),
                          Color(0xFF5d89d4),
                        ],
                      )),
                      height: ScreenSize.fSize_40(),
                      width: ScreenSize.fSize_100(),
                      child: Icon(
                        size: 35,
                        color: _controller!.value.isPlaying
                            ? Colors.red
                            : Colors.green,
                        _controller!.value.isPlaying
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                    ),
                  ),*/
                    SizedBox(height: ScreenSize.fSize_10()),
                  ],
                ),
              ),
      ),
    );
  }
}
