import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:music1/screens/album/album.dart';
import 'package:music1/screens/favorites/favorite.dart';
import 'package:music1/screens/musics/mymusic.dart';
import 'package:music1/screens/playlist.dart';

class screenhome extends StatefulWidget {
  screenhome({Key? key}) : super(key: key);

  @override
  State<screenhome> createState() => _screenhomeState();
}

class _screenhomeState extends State<screenhome> {
  int _currentselectedindex = 0;

  final _pages=[
    musicscreen(),
    albumscreen(),
     favoritescreen(),
    playlistscreen(),
   

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       body: _pages[_currentselectedindex],
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.black,
      //     showUnselectedLabels: true,
      //     selectedItemColor: Colors.yellow,
      //     unselectedItemColor: Colors.grey,
      //     currentIndex: _currentselectedindex,
      //     onTap: (newindex){
      //       setState(() {
      //         _currentselectedindex =newindex;
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
              
      //           icon: Icon(Icons.headphones),
      //           label: 'My Music',
      //           ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.music_note), 
      //         label: 'Albums',
      //       ),
      //        BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite),
      //         label: 'Favorite',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.playlist_play),
      //         label: 'Play list',
      //       ),
           
      //     ]),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(150, 158, 158, 158),
        backgroundColor: Colors.black,
        buttonBackgroundColor: Color.fromARGB(255, 158, 158, 158),
        animationDuration: Duration(microseconds: 300),
        
        animationCurve: Curves.bounceInOut,
        
        items: [
        Icon(Icons.headphones ,),
         Icon(Icons.music_note), 
         Icon(Icons.favorite,),
          Icon(Icons.playlist_play),
      ],
      onTap: (newindex){
        setState(() {
           _currentselectedindex =newindex;
        });

      },
      )
      ,
    );
  }
}
// queue_music