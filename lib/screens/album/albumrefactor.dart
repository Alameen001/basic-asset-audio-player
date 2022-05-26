
// import 'package:flutter/material.dart';
// import 'package:music1/screens/musics/mymusic.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class albumrfctor extends StatelessWidget {

// final String imag1;
// final String title;


// albumrfctor({
//   required this.imag1,
//   required this.title,
// });

//   get index => null;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<AlbumModel>>(
//       future: audioQuery.queryAlbums(),
//       builder: (context,songs) {
//         if (songs.data == null) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (songs.data!.isEmpty) {
//                   return const Center(
//                     child: Text('No Songs Found'),
//                   );
//                 }
//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Container(
//                 height: 150,
//                 width: 200,
//                 child: QueryArtworkWidget(id: songs.data![index].id, type:ArtworkType.ALBUM ),
        
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
                  
//                   // image: DecorationImage(image: AssetImage(imag1),fit: BoxFit.fill)
                  
//                 ),
//               ),
              
//             ),
//             // Text(title,style: TextStyle( color: Color.fromARGB(255, 233, 217, 72),
//             //       fontWeight: FontWeight.w600,),),
//           ],
//         );
//       }
//     );
//   }
// }