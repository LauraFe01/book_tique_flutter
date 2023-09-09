import 'package:BookTique/screens/CatalogoPage.dart';
import 'package:BookTique/screens/homeScreen.dart';
import 'package:BookTique/screens/ImpostazioniPage.dart';
import 'package:BookTique/screens/LoginPage.dart';
import 'package:BookTique/screens/RegistrationPage.dart';
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
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/home': (context)=> HomeScreen(),
        '/impostazioni': (context)=> ImpostazioniPage(),
      },
    );
  }
}