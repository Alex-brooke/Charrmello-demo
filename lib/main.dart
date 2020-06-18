import 'package:flutter/material.dart';
import 'BottomNavigationBarController.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new MaterialApp(
      title: 'Test App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationBarController(),
    ),
    );

  }
}