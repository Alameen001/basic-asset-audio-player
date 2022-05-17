 
 import 'package:flutter/material.dart';
import 'package:music1/screens/album/albumrefactor.dart';

class albumscreen extends StatelessWidget {
   const albumscreen({ Key? key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Album',
          
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
      body: Container(
        color: Colors.black,
        child: GridView.count(crossAxisCount: 2,
        
            crossAxisSpacing: 10,
         childAspectRatio: 25 / 28,
        children: [
         
            albumrfctor(imag1: 'assets/tylor.jpeg', title: 'Taylor Swift - (Songs)'),
                albumrfctor(imag1: 'assets/weekend.jpeg', title: 'The Weeknd Reveals'),
          
             
              albumrfctor(imag1: 'assets/zyn1.jpeg', title: 'ZAYN - Let Me (Official '),
             
              albumrfctor(imag1: 'assets/just us.jpeg', title: 'Grover washington (Album)'),
                albumrfctor(imag1: 'assets/dualipa.jpeg', title: 'Dua Lipa (album)'),
               albumrfctor(imag1: 'assets/drike.jpg', title: 'Drake unveils'),
                 albumrfctor(imag1: 'assets/saleena.jpeg', title: 'Selena Gomez ‘Revelación’'),
                    albumrfctor(imag1: 'assets/xxtention.jpeg', title: 'Xxxtentacion (Album)'),
         
             
         
             
             
             
        ],
        ),
        
      ),
    );
   }
 }