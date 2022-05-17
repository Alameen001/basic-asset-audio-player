
import 'package:flutter/material.dart';

class albumrfctor extends StatelessWidget {

final String imag1;
final String title;


albumrfctor({
  required this.imag1,
  required this.title,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            height: 150,
            width: 200,
    
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              
              image: DecorationImage(image: AssetImage(imag1),fit: BoxFit.fill)
            ),
          ),
          
        ),
        Text(title,style: TextStyle( color: Color.fromARGB(255, 233, 217, 72),
              fontWeight: FontWeight.w600,),),
      ],
    );
  }
}