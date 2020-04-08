import 'package:flutter/material.dart';
import 'package:flutterapp/main/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: HomePage(),
    );
  }
}



