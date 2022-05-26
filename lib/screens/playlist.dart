// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:music1/screens/favorites/favorite.dart';
// import 'package:music1/screens/settings.dart';

// class playlistscreen extends StatelessWidget {
//    playlistscreen({Key? key}) : super(key: key);
//    AssetsAudioPlayer player = AssetsAudioPlayer();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title:  Text(
//           'Playlist',
//          style: GoogleFonts.inter(
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//             color: Colors.white,
//           ),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//                 return const Settingsscreen();
//               }));
//             },
//             icon: const Icon(
//               Icons.line_weight_rounded,
//               color: Colors.yellow,
//             )),
//         // actions: [Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: Icon(Icons.search,color: Colors.yellow,size: 30,),
//         // )],
//         centerTitle: true,
//       ),
//       body: Container(
//              color: Color.fromARGB(255, 29, 28, 28),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: GestureDetector(
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: const Icon(
//                     Icons.favorite,
//                     color: Colors.red,
//                   ),
//                   title: const Text(
//                     'Favorites',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   subtitle: const Text(
//                     '45 Songs',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   trailing: const Icon(
//                     Icons.more_vert_outlined,
//                     color: Color.fromARGB(255, 233, 217, 72),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (ctx) => const favoritescreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const ListTile(
//                   leading: Icon(Icons.phone_android,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                   title: Text(
//                     'Recently Added',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   subtitle: Text(
//                     '40 Songs',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   trailing: Icon(Icons.more_vert_outlined,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                 ),
//                 const ListTile(
//                   leading: Icon(Icons.music_note_outlined,
//                       color:  Color.fromARGB(255, 233, 217, 72)),
//                   title: Text(
//                     'Most Played',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   subtitle: Text(
//                     '27 Songs',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   trailing: Icon(Icons.more_vert_outlined,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                 ),
//                 const ListTile(
//                   leading: Icon(Icons.music_note_outlined,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                   title: Text(
//                     'Recently Pleyed',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   subtitle: Text(
//                     '57 Songs',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   trailing: Icon(Icons.more_vert_outlined,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                 ),
//                 const ListTile(
//                   leading: Icon(Icons.playlist_play_outlined,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                   title: Text(
//                     'My Playlist',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   subtitle: Text(
//                     '55 Songs',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromARGB(255, 233, 217, 72)),
//                   ),
//                   trailing: Icon(Icons.more_vert_outlined,
//                       color: Color.fromARGB(255, 233, 217, 72)),
//                 ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music1/function/function.dart';
import 'package:music1/playlistifo.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/on_audio_room.dart';

class playlistscreen extends StatefulWidget {
  playlistscreen({Key? key}) : super(key: key);

  @override
  State<playlistscreen> createState() => _playlistscreenState();
}

class _playlistscreenState extends State<playlistscreen> {
  final OnAudioRoom _audioRoom = OnAudioRoom();
  @override
  Widget build(BuildContext context) {
    final OnAudioQuery _audioQuery = OnAudioQuery();

    //return Container();
    return Scaffold(
        backgroundColor: Color.fromARGB(188, 182, 36, 111),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          title: Text(
            'Playlists',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  createPlaylistFrom(context, () {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.playlist_add))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color.fromARGB(255, 0, 128, 255),
                    Colors.black,
                  ]),
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              // color: Color.fromARGB(188, 182, 36, 111),
            ),
            height: double.infinity,
            width: double.infinity,
            child: FutureBuilder<List<PlaylistEntity>>(
                future: _audioRoom.queryPlaylists(),
                builder: (context, songs) {
                  if (songs.data == null || songs.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'Nothing Found',
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    );
                  }

                  return ListView.separated(
                      itemBuilder: (ctx, index) => Slidable(
                            endActionPane: ActionPane(
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    dialog(context, songs.data![index].key,
                                        songs.data![index].playlistName);
                                  },
                                  backgroundColor: Colors.green.shade400,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'Edit',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                content: const Text(
                                                    'Do you really want to delete?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('NO'),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _audioRoom
                                                              .deletePlaylist(
                                                                  songs
                                                                      .data![
                                                                          index]
                                                                      .key);
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                        // Navigator.of(context).pushAndRemoveUntil(
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => const Home()),
                                                        //     (Route<dynamic> route) => false);
                                                      },
                                                      child: const Text('YES')),
                                                ],
                                              ));
                                      // _audioRoom.deletePlaylist(
                                      //     item.data![index].key);
                                    });
                                  },
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                              motion: ScrollMotion(),
                            ),
                            child: ListTile(
                              onTap: () {
                                //final x = item.data[index].key;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => PlaylistInfo(
                                              title: songs
                                                  .data![index].playlistName,
                                              songs: songs
                                                  .data![index].playlistSongs,
                                              playlistKey:
                                                  songs.data![index].key,
                                            )));
                                //final x = item.data![index].playlistSongs;
                                // print(x);
                                //list songs in playlist
                                // final x = item.data![index].;
                                // _audioRoom.addAllTo(RoomType.PLAYLIST, )
                                //print(item.data![index].dateAdded);
                                // final x = await _audioQuery.queryAudiosFrom(
                                //     AudiosFromType.PLAYLIST,
                                //     item.data![index].playlist);
                                // print(x);
                              },
                              contentPadding: EdgeInsets.only(left: 20),
                              title: Text(
                                songs.data![index].playlistName,
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              ),
                              leading: Icon(
                                Icons.music_note,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      separatorBuilder: (ctx, index) => Divider(),
                      itemCount: songs.data!.length);
                })));
  }

  void dialog(BuildContext context, int key, String playlistName) {
    var playlistNameController = TextEditingController();
    playlistNameController.text = playlistName;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx1) => AlertDialog(
              content: TextField(
                  controller: playlistNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //filled: true,

                    hintStyle: TextStyle(color: Colors.grey[600]),
                    // hintText: playlistName,
                  )),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx1);
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _audioRoom.renamePlaylist(
                            key, playlistNameController.text);
                      });
                      Navigator.pop(ctx1);
                      //createNewPlaylist(playlistNameController.text);

                      // dialogBox(context);
                    },
                    child: Text('Ok'))
              ],
            ));
  }
}
