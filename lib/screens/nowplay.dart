import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music1/screenhome.dart';

import 'musics/mymusic.dart';

class Nowplaying extends StatefulWidget {
  int index;
  bool playing = false;

  String imageurl;

  String title;

  String subtitle;
  Nowplaying({
    required this.imageurl,
    required this.title,
    required this.subtitle,
    required this.index,
  });

  @override
  State<Nowplaying> createState() => _NowplayingState();
}

class _NowplayingState extends State<Nowplaying>
    with SingleTickerProviderStateMixin {


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

    openPlayer();

    // player.open(Playlist(audios: audio, startIndex: 0),
    //     showNotification: true, autoStart: false);
  }

  void openPlayer() async {
    await assetsAudioPlayer.open(
      Playlist(audios: audio, startIndex: widget.index),
      showNotification: true,
      autoStart: true,
   
     
    );
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  bool isplaying = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Now Playing',
          style: TextStyle(
              color: Color.fromARGB(255, 233, 217, 72),
              fontWeight: FontWeight.w600,
              fontSize: 30,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) {
                  return screenhome();
                }));
              },
              icon: const Icon(Icons.arrow_drop_down))
        ],
        centerTitle: true,
      ),
      

      body: Container(
        color: Colors.black,
 

        child: Column(
          children: [
            StreamBuilder<Playing?>(
              stream: assetsAudioPlayer.current,
              builder: (context, playing) {
                if (playing.data != null) {
                  final myaudio =
                      find(audio, playing.data!.audio.assetAudioPath);
                  print("......................$audio");
                  return Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 13
                          ),
                          Text(
                            "${myaudio.metas.title}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10
                          ),
                          Text(
                            "${myaudio.metas.artist}",
                            style: const TextStyle(color: Colors.white),
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 43, right: 42, bottom: 20),
                            child: Container(
                              
                             
                              height: 320,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(190),

                               
                              ),
                           
                              child: CircleAvatar(
                                backgroundImage: ExactAssetImage(
                                  myaudio.metas.image!.path,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 14,),

                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: seekBarWidget(context)),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(), 
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shuffle,
                                    size: 40,
                                    color: Color.fromARGB(255, 231, 217, 90),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  child: IconButton(
                                    onPressed: () {
                                      assetsAudioPlayer.previous();
                                    },
                                    icon: const Icon(
                                      Icons.skip_previous_sharp,
                                      size: 40,
                                      color: Color.fromARGB(255, 231, 217, 90),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                // IconButton(
                                //   onPressed: () {
                                //     if (isplaying != true) {
                                //       setState(() {
                                //         playbtn =
                                //             Icons.play_circle_filled_sharp;
                                //         isplaying = true;
                                //         assetsAudioPlayer.playOrPause();
                                //       });
                                //     } else {
                                //       setState(() {
                                //         playbtn = Icons.pause_circle_sharp;
                                //         isplaying = false;
                                //         assetsAudioPlayer.playOrPause();
                                //       });
                                //     }
                                //   },
                                //   icon: Icon(
                                //     playbtn,
                                //     size: 70,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    animateicon();
                                  },
                                  child: AnimatedIcon(
                                    icon: AnimatedIcons.pause_play,
                                    progress: iconCntroller,
                                    size: 65,
                                    color:
                                        const Color.fromARGB(255, 231, 217, 90),
                                  ),
                                ),

                                Spacer(),
                               

                                InkWell(
                                  child: IconButton(
                                    onPressed: () {
                                      // player.seekBy(Duration(seconds:10));
                                      assetsAudioPlayer.next();
                                    },
                                    icon: const Icon(
                                      Icons.skip_next_sharp,
                                      size: 40,
                                      color: Color.fromARGB(255, 231, 217, 90),
                                    ),
                                  ),
                                ),
                                Spacer(),
                               

                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.repeat,
                                    size: 40,
                                    color:
                                        const Color.fromARGB(255, 231, 217, 90),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          
                        ],
                      ),
                    ],
                  );
                }else{
                return const SizedBox();
                }
              },
            ),
          ],
        ),
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
    return assetsAudioPlayer.builderRealtimePlayingInfos(builder: (ctx, infos) {
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
    });
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


 