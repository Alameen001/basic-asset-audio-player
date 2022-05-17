import 'package:flutter/material.dart';
import 'package:music1/splash.dart';

void main(List<String> args) {
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Splashscreen(),
    );
  }
}