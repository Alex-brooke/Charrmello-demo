import 'package:flutter/material.dart';
import 'package:Charmello_v0/screens/home_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  //This wiget is the root of the appliaction.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charmello Version 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3A5753),
        accentColor: Color(0xFFEF8984),
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
      ),
      home: HomeScreen(),
    );
  }
}