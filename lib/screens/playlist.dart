import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music1/screens/favorites/favorite.dart';
import 'package:music1/screens/settings.dart';

class playlistscreen extends StatelessWidget {
   playlistscreen({Key? key}) : super(key: key);
   AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Playlist',
          style: TextStyle(
              color: Color.fromARGB(255, 233, 217, 72),
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontStyle: FontStyle.italic),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const Settingsscreen();
              }));
            },
            icon: const Icon(
              Icons.line_weight_rounded,
              color: Colors.yellow,
            )),
        // actions: [Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Icon(Icons.search,color: Colors.yellow,size: 30,),
        // )],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Favorites',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  subtitle: const Text(
                    '45 Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  trailing: const Icon(
                    Icons.more_vert_outlined,
                    color: Color.fromARGB(255, 233, 217, 72),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const favoritescreen(),
                      ),
                    );
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.phone_android,
                      color: Color.fromARGB(255, 233, 217, 72)),
                  title: Text(
                    'Recently Added',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  subtitle: Text(
                    '40 Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  trailing: Icon(Icons.more_vert_outlined,
                      color: Color.fromARGB(255, 233, 217, 72)),
                ),
                const ListTile(
                  leading: Icon(Icons.music_note_outlined,
                      color:  Color.fromARGB(255, 233, 217, 72)),
                  title: Text(
                    'Most Played',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  subtitle: Text(
                    '27 Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  trailing: Icon(Icons.more_vert_outlined,
                      color: Color.fromARGB(255, 233, 217, 72)),
                ),
                const ListTile(
                  leading: Icon(Icons.music_note_outlined,
                      color: Color.fromARGB(255, 233, 217, 72)),
                  title: Text(
                    'Recently Pleyed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  subtitle: Text(
                    '57 Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  trailing: Icon(Icons.more_vert_outlined,
                      color: Color.fromARGB(255, 233, 217, 72)),
                ),
                const ListTile(
                  leading: Icon(Icons.playlist_play_outlined,
                      color: Color.fromARGB(255, 233, 217, 72)),
                  title: Text(
                    'My Playlis',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  subtitle: Text(
                    '55 Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 233, 217, 72)),
                  ),
                  trailing: Icon(Icons.more_vert_outlined,
                      color: Color.fromARGB(255, 233, 217, 72)),
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }


}
