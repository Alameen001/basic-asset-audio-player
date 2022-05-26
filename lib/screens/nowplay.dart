import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:music1/screenhome.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'musics/mymusic.dart';

class Nowplaying extends StatefulWidget {
  int? index;
  bool playing = false;
  List<Audio>? audio;

  // String imageurl;

  // String title;

  // String subtitle;
  Nowplaying({
    Key? key,
     this.audio,
    // required this.imageurl,
    // required this.title,
    // required this.subtitle,
     this.index,
  }) : super(key: key);

  @override
  State<Nowplaying> createState() => _NowplayingState();
}

class _NowplayingState extends State<Nowplaying>
    with SingleTickerProviderStateMixin {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');
  final OnAudioQuery audioQuery = OnAudioQuery();

  bool isAnimated = false;
  bool isPlaying = false;
  bool showPlay = false;
  bool showPause = false;

  late AnimationController iconCntroller;

  List<String> a = [];
  @override
  void initState() {
    super.initState();
    iconCntroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    assetsAudioPlayer.open(
      Playlist(
        audios: widget.audio,
        startIndex: widget.index!,
      ),
      autoStart: true,
      showNotification: true,
      loopMode: LoopMode.playlist,
      playInBackground: PlayInBackground.enabled,
    );
  }

  bool isplaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text(
          'Now Playing',
          // style: TextStyle(
          //     color: Color.fromARGB(255, 233, 217, 72),
          //     fontWeight: FontWeight.w600,
          //     fontSize: 30,
          //     fontStyle: FontStyle.italic),
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
          
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_drop_down))
        ],
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 29, 28, 28),
        child: assetsAudioPlayer.builderCurrent(builder: ((context, playing) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: Marquee(
                    velocity: 20,
                    blankSpace: 50,

                    text: '${playing.playlist.current.metas.title}',
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 30,
                  width: 150,
                  child: Marquee(
                    blankSpace: 20,
                    velocity: 20,
                    text: '${playing.playlist.current.metas.artist}',
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 245, 243, 243),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 43, right: 42, bottom: 20),
                  child: Container(
                    height: 320,
                    width: 350,
                    child: QueryArtworkWidget(
                        artworkBorder: BorderRadius.circular(20),
                        artworkFit: BoxFit.cover,
                        artworkQuality: FilterQuality.high,
                        quality: 100,
                        nullArtworkWidget: Image.asset("assets/music.jpeg"),
                        size: 300,
                        id: int.parse(playing.playlist.current.metas.id!),
                        type: ArtworkType.AUDIO),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: seekBarWidget(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shuffle,
                          size: 28,
                          color:  Colors.white,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        child: IconButton(
                          onPressed: () {
                            assetsAudioPlayer.previous();
                          },
                          icon: const Icon(
                            Icons.skip_previous_sharp,
                            size: 48,
                            color: Colors.white
                          ),
                        ),
                      ),
                      const Spacer(),

                      assetsAudioPlayer.builderIsPlaying(
                        builder: ((context, isPlaying) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: IconButton(
                              icon: Icon(
                                isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                size: 58,
                              ),
                              onPressed: () {
                                assetsAudioPlayer.playOrPause();
                              },
                              color:  Colors.white
                            ),
                          );
                        }),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     animateicon();
                      //   },
                      //   child: AnimatedIcon(
                      //     icon: AnimatedIcons.pause_play,
                      //     progress: iconCntroller,
                      //     size: 65,
                      //     color: const Color.fromARGB(255, 231, 217, 90),
                      //   ),
                      // ),

                      const Spacer(),

                      // InkWell(
                      //   child: IconButton(
                      //     onPressed: () {
                      //       // player.seekBy(Duration(seconds:10));
                      //       assetsAudioPlayer.next();
                      //     },
                      //     icon: const Icon(
                      //       Icons.skip_next_sharp,
                      //       size: 40,
                      //       color: Color.fromARGB(255, 231, 217, 90),
                      //     ),
                      //   ),
                      // ),
                      IconButton(
                        onPressed: playing.index == songs.length - 1
                            ? () {}
                            : () {
                                assetsAudioPlayer.next();
                              },
                        icon: playing.index == songs.length - 1
                            ? Icon(
                                Icons.skip_next_sharp,
                                size: 48,
                                color: Color.fromARGB(255, 94, 91, 66),
                              )
                            : const Icon(
                                Icons.skip_next_sharp,
                                size: 48,
                                color: Colors.white
                              ),
                      ),
                      const Spacer(),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.repeat,
                          size: 28,
                          color: Colors.white
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          );
        })),
      ),
    );
  }

  void animateicon() {
    setState(() {
      isAnimated = !isAnimated;
      isPlaying = !isplaying;

      if (isAnimated) {
        iconCntroller.reverse();
        assetsAudioPlayer.play();
      } else {
        iconCntroller.forward();
        assetsAudioPlayer.pause();
      }
      // if(isPlaying){
      //   iconCntroller.reverse();
      //   assetsAudioPlayer.play();
      // } else{
      //   iconCntroller.forward();
      //   assetsAudioPlayer.pause();
      // }
    });
  }

  Widget seekBarWidget(BuildContext ctx) {
    return assetsAudioPlayer.builderRealtimePlayingInfos(
      builder: (ctx, infos) {
        Duration currentPosition = infos.currentPosition;
        Duration total = infos.duration;
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: ProgressBar(
              progress: currentPosition,
              total: total,
              onSeek: (to) {
                assetsAudioPlayer.seek(to);
              },
              timeLabelTextStyle: const TextStyle(color: Colors.white),
              baseBarColor: const Color.fromARGB(255, 190, 190, 190),
              progressBarColor: Colors.yellow,
              bufferedBarColor: Colors.red,
              thumbColor: Colors.white),
        );
      },
    );
  }

  //  void openPlayer() async {
  //   await _assetsAudioPlayer.open(
  //     Playlist(audios: audios, startIndex: 0),
  //     showNotification: true,
  //     autoStart: true,
  //   );
  // }
}
//  player.open(Audio('assets/music/Parudeesa(PaglaSongs).mp3'),autoStart: false,showNotification: true);
