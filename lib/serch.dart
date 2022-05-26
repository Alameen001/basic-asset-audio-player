// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:music1/screens/musics/mymusic.dart';

// class SearchSongs extends SearchDelegate {
//   List<String> allSongs = [''];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text(
//         query,
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final songData = query.isEmpty
//         ? songs
//         : songs
//                 .where(
//                   (element) => element.metas.title!.toLowerCase().contains(
//                         query.toLowerCase().toString(),
//                       ),
//                 )
//                 .toList() +
//             songs
//                 .where(
//                   (element) => element.metas.artist!.toLowerCase().contains(
//                         query.toLowerCase().toString(),
//                       ),
//                 )
//                 .toList();
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: songData.isEmpty?Center(
//         child: Text('No songs found'),
//       ):ListView.builder(itemBuilder: (context, index) {
//         Container(
//           height: 90,
//             decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(10),
//                         ),
//                          gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Color.fromARGB(255, 231, 217, 90),
//                             Color.fromARGB(255, 137, 182, 219),
//                           ],
//                         ),
                        
//                       ),
                   
//         );
//       },)
//     );
//   }
// }
