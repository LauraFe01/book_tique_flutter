import 'package:flutter/material.dart';
import 'package:my_app/screens/catalogo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatalogoHome(),
    );
  }
}