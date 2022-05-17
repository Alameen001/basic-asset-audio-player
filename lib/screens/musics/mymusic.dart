// ignore_for_file: prefer_const_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music1/music1.dart';

import 'package:music1/screens/nowplay.dart';

class musicscreen extends StatefulWidget {
  musicscreen({Key? key}) : super(key: key);

  @override
  State<musicscreen> createState() => _musicscreenState();
}
 AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');

class _musicscreenState extends State<musicscreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.yellow,
            )),
        backgroundColor: Colors.black,
        title: Text(
          'My Music',
          style: TextStyle(
              color: Color.fromARGB(255, 233, 217, 72),
              fontWeight: FontWeight.w600,
              fontSize: 30,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.yellow,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
      ),
     
      body: Container(
        color: Colors.black,
        child: Column(
          
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.7,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  print("121 ${audio.length}");
                  return newMusic1(
                    index: index,
                    imageurl: audio[index].metas.image!.path,
                    title: audio[index].metas.title.toString(),
                    subtitle: audio[index].metas.artist.toString(),
                    
                  );
                },
                itemCount: audio.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////my musics

List<Audio> audio = [
  Audio(
    "assets/music/Dusk Till Dawn(Mr-Jatt1.com).mp3",
    metas: Metas(
      title: "Dusk Till Dawn",
      artist: "feat.Sia..",
      // album: "CountryAlbum",
      image: MetasImage.asset("assets/zyn1.jpeg"), //can be MetasImage.network
    ),
  ),
  Audio(
    "assets/music/Parudeesa(PaglaSongs).mp3",
    metas: Metas(
      title: "BeeshmaParvam",
      artist: "Sreenath Basi",
      // album: "CountryAlbum",
      image: const MetasImage.asset(
          "assets/tylor.jpeg"), //can be MetasImage.network
    ),
  ),
  Audio(
    "assets/music/Vilayadu-Mangatha.mp3",
    metas: Metas(
      title: "Mankatha",
      artist: "Florent Champigny",
      // album: "CountryAlbum",
      image: const MetasImage.asset(
          "assets/weekend.jpeg"), //can be MetasImage.network
    ),
  ),
  Audio(
    "assets/music/Nanbane.mp3",
    metas: Metas(
      title: "Country",
      artist: "Florent Champigny",
      // album: "CountryAlbum",
      image: MetasImage.asset("assets/drike.jpg"), //can be MetasImage.network
    ),
  ),
];
