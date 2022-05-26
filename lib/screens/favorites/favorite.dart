import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          
        style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
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