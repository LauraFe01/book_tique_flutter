import 'package:book_tique/screens/catalogo.dart';
import 'package:book_tique/screens/homeScreen.dart';
import 'package:book_tique/screens/impostazioni.dart';
import 'package:book_tique/screens/login.dart';
import 'package:book_tique/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF4E0),
      ),
      home: CatalogoHome(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/home': (context)=> CatalogoHome(),
        '/impostazioni': (context)=> ImpostazioniScreen(),
      },
    );
  }
}