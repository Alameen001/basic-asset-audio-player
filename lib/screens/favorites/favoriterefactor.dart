


import 'package:flutter/material.dart';
import 'package:music1/screens/nowplay.dart';

class favrefactor extends StatelessWidget {
   final String image1;
  final String titile;

  favrefactor({
    required this.image1,
    required this.titile,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
     
      color: Colors.black,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SizedBox())),
              child: Container(
                height: 80,
                width: size.width * 0.955,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 231, 217, 90),
                          Color.fromARGB(255, 137, 182, 219),
                        ],
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 65,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            image: DecorationImage(
                              image: AssetImage(image1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titile,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_android,
                                  size: 15,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Unknown Artist',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.favorite,
                        size: 30,color: Colors.red,
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
    
  }
}