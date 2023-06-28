import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Mediaquery/Media%20Query.dart';
import 'package:text_scroll/text_scroll.dart';

class AudioPickScreen extends StatefulWidget {
  const AudioPickScreen({Key? key}) : super(key: key);

  @override
  State<AudioPickScreen> createState() => _AudioPickScreenState();
}

class _AudioPickScreenState extends State<AudioPickScreen> {
  // final List<Color> colors = [
  //   Colors.red[900]!,
  //   Colors.green[900]!,
  //   Colors.blue[900]!,
  //   Colors.brown[900]!
  // ];
  //
  // final List<int> animationduration = [900, 700, 600, 800, 500];
  // final List<int> animationduration2 = [1, 2, 3, 4, 5];

  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState

    setAudio();
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      audioPlayer.setSourceUrl(file.path);
    }

    // String url =
    //     "https://www.chosic.com/similar-songs/track/3WsbAGQt6HgTj9kg6f466M/";

    // final file = File(
    //     "https://www.chosic.com/similar-songs/track/3WsbAGQt6HgTj9kg6f466M/");
    // audioPlayer.setSourceUrl(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(context, "", "/AudioPickScreen"),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                  NetworkImage("https://img.freepik.com/free-vector/blurred-background-with-light-colors_1034-245.jpg?w=2000"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ScreenSize.fSize_20()),
                    child: Image.asset(
                      "assets/shapes/image.png",
                      // width: double.infinity,
                      // height: ScreenSize.fSize_200(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_60()),
                  TextScroll(
                    audioPlayer.playerId,
                    style: GoogleFonts.georama(
                        fontSize: ScreenSize.fSize_20(),
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(height: ScreenSize.fSize_30()),
                  Slider(
                    // inactiveColor: Colors.black,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);

                      await audioPlayer.resume();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(position),style: GoogleFonts.georama(color: Colors.black),),
                        Text(formatTime(duration - position),style: GoogleFonts.georama(color: Colors.black),),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 35,
                    child: IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      iconSize: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          banner.getBN("/AudioPickScreen")
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }
}
