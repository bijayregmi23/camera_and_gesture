import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera',
      theme: ThemeData.dark(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}