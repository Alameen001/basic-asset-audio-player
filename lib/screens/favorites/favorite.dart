import 'package:flutter/material.dart';
import 'package:music1/screens/favorites/favoriterefactor.dart';

class favoritescreen extends StatelessWidget {
  const favoritescreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Favorites',
          
          style: TextStyle(
              color: Color.fromARGB(255, 233, 217, 72),
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontStyle: FontStyle.italic),
        ),
        leading: Icon(Icons.line_weight_rounded,color: Colors.yellow,size: 30,),
        // actions: [Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Icon(Icons.search,color: Colors.yellow,size: 30,),
        // )],
        centerTitle: true,
      ),

      body: ListView(
        children: [
          favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
            favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
              favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
                favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
            favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
              favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
                   favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
            favrefactor( image1: 'assets/music.jpeg', titile: 'Darkeye & The Keys'),
              

              



        ],
      ),
    );
    
  }
}