import 'package:book_tique/screens/catalogo.dart';
import 'package:book_tique/screens/homeScreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:  Color(0xFFFFF4E0), 
      ),
      home: CatalogoHome(),
    );
  }
}