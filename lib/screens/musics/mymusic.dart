// ignore_for_file: prefer_const_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:music1/screens/nowplay.dart';
import 'package:music1/serch.dart';
import 'package:on_audio_query/on_audio_query.dart';

class musicscreen extends StatefulWidget {
  musicscreen({Key? key}) : super(key: key);

  @override
  State<musicscreen> createState() => _musicscreenState();
}

List<Audio> songs = [];
final OnAudioQuery audioQuery = OnAudioQuery();

class _musicscreenState extends State<musicscreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');

  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  final OnAudioQuery audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 28, 28),
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.yellow,
        //     )),
        backgroundColor: Colors.black,
        title: Text(
          'My Music',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<List<SongModel>>(
        future: audioQuery.querySongs(
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
        ),
        builder: (context, allsongs) {
          if (allsongs.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // if (allsongs.data!.isEmpty) return const Text('No Songs Found');
            //    List<Audio> songs = [];

            //  return ListView.builder(itemBuilder: (context, index) => GestureDetector(
            //    onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Nowplaying(audio: songs, index: index)));
            //    },
            //    child: ListTile(
            //        leading: Icon(Icons.music_note_outlined),
            //         title: Text(allsongs.data![index].displayNameWOExt),
            //         subtitle: Text('${allsongs.data![index].artist}'),
            //    ),
            //  ),itemCount: allsongs.data!.length,
            //  );

            List<SongModel> songmodel = allsongs.data!;
            // print(songmodel.length);

            for (var song in songmodel) {
              songs.add(Audio.file(
                song.uri.toString(),
                metas: Metas(
                  title: song.displayName,
                  artist: song.artist,
                  id: song.id.toString(),
                ),
              ));
            }

            return ListView.builder(
              itemCount: allsongs.data!.length,
              itemBuilder: (context, index) {
                String artist = songs[index].metas.artist.toString();
                if (artist == "<unknown>" && artist == "") {
                  artist = "No artist";
                } else {
                  artist = songs[index].metas.artist.toString();
                }

                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 231, 217, 90),
                          Color.fromARGB(255, 137, 182, 219),
                        ],
                      ),
                    ),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  Nowplaying(audio: songs, index: index)));
                        },
                        title: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(allsongs.data![index].displayNameWOExt,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        subtitle: Text(artist,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        leading: QueryArtworkWidget(
                          artworkFit: BoxFit.cover,
                          artworkHeight: 60,
                          artworkWidth: 60,
                          id: allsongs.data![index].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: ClipRRect(
                            child: Image.asset(
                              "assets/music.jpeg",
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert))),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  bool notification = true;
  void play(List<Audio> songs, int index) {
    assetsAudioPlayer.open(Playlist(audios: songs, startIndex: index),
        showNotification: notification,
        loopMode: LoopMode.playlist,
        playInBackground: PlayInBackground.enabled,
        notificationSettings: NotificationSettings(stopEnabled: false));
  }
}
