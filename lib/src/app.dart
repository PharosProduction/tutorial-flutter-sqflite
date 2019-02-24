import 'package:flutter/material.dart';
import 'package:tutorial_flutter_sqflite/src/screens/main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Car Database'),
        ),
        body: MainPage(),
      ),
    );
  }
}
