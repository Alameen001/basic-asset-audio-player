
import 'package:flutter/material.dart';
class Settingsscreen extends StatelessWidget {
  const Settingsscreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.yellow,) ),
        title: Text('Settings',style: TextStyle(
              color: Color.fromARGB(255, 233, 217, 72),
              fontWeight: FontWeight.bold,
              fontSize: 20,),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 218, 213, 172),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.share_outlined),
              title: Text('Share App', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,),),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy policy',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,),),
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Rate Us',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,),),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20,),),
            ),
            Spacer(),
              Column(
                 children: [
                   Text('Version',style: TextStyle(color: Colors.grey),),
                    Text('2.4.2',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                 ],
               ),
           SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}