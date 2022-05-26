import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'package:music1/screens/album/album.dart';
import 'package:music1/screens/favorites/favorite.dart';
import 'package:music1/screens/musics/mymusic.dart';
import 'package:music1/screens/nowplay.dart';
import 'package:music1/screens/playlist.dart';

class screenhome extends StatefulWidget {
  screenhome({Key? key}) : super(key: key);

  @override
  State<screenhome> createState() => _screenhomeState();
}

class _screenhomeState extends State<screenhome> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  int _currentselectedindex = 0;

  final _pages = [
    musicscreen(),
   AlbumPage(),
    favoritescreen(),
    playlistscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      

      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        
        color: Color.fromARGB(150, 158, 158, 158),
        backgroundColor: Colors.black,
        buttonBackgroundColor: Color.fromARGB(255, 158, 158, 158),
        animationDuration: Duration(microseconds: 300),
        animationCurve: Curves.bounceInOut,
        items: [
          Icon(
            Icons.headphones,
          ),
          Icon(Icons.music_note),
          Icon(
            Icons.favorite,
          ),
          Icon(Icons.playlist_play),
        ],
        onTap: (newindex) {
          setState(() {
            _currentselectedindex = newindex;
          });
        },
      ),
      body: _pages[_currentselectedindex],
      bottomSheet: Container(
        color: Colors.black,
        height: 75,
        child: assetsAudioPlayer.builderCurrent(
          builder: (BuildContext context, Playing? playing) {
            return ListTile(
             
              title: SizedBox(
                height: 18,
                child: SizedBox(
                  height: 30,
                  width: 300
                  ,
                  child: Marquee(
                    velocity: 20,
                    blankSpace:20,
                    text :
                      assetsAudioPlayer.getCurrentAudioTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    
                  ),
                ),
              ),
              subtitle: Text(
                assetsAudioPlayer.getCurrentAudioArtist.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  //  previous
                  IconButton(
                    onPressed: () {
                      assetsAudioPlayer.previous();
                    },
                    icon: const Icon(
                      Icons.skip_previous_rounded,
                      color: Colors.white,
                      size: 43,
                    ),
                  ),
                
                  // play pause
                  PlayerBuilder.isPlaying(
                    player: assetsAudioPlayer,
                    builder: (context, isPlaying) {
                      return IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle,
                          size: 43,
                        ),
                        onPressed: () {
                          assetsAudioPlayer.playOrPause();
                        },
                        color: Colors.white,
                      );
                    },
                  ),

                  // next
                  // IconButton(
                  //   iconSize: 45,
                  //   onPressed: () {
                  //     assetsAudioPlayer.next();
                  //   },
                  //   icon: const Icon(
                  //     Icons.skip_next_rounded,
                  //     color: Colors.white,
                  //     size: 43,
                  //   ),
                  // ),
                   IconButton(
                      onPressed: playing?.index == songs.length - 1
                          ? () {}
                          : () {
                              assetsAudioPlayer.next();
                            },
                      icon: playing?.index == songs.length - 1
                          ? Icon(
                              Icons.skip_next_sharp,
                              size: 40,
                              color: Color.fromARGB(255, 241, 240, 225),
                            )
                          : const Icon(
                              Icons.skip_next_sharp,
                              size: 40,
                              color: Colors.white
                            ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
// queue_music