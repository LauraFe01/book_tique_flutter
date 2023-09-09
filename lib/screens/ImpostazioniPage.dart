
import 'package:flutter/material.dart';
import 'package:BookTique/screens/LoginPage.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ImpostazioniPage extends StatefulWidget {
  @override
  _ImpostazioniPageState createState() => _ImpostazioniPageState();
}

class _ImpostazioniPageState extends State<ImpostazioniPage> {
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMPOSTAZIONI',
          style: TextStyle(
            fontFamily: 'LoraBoldItalic',
            fontSize: 30,
            color: Color(0xFFFFBF9B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[800],
        toolbarHeight: 80,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 48),
              Icon(
                Icons.account_circle,
                size: 99,
                color: Color(0xFFB46060),
              ),
              SizedBox(height: 15),
              Text(
                _currentUser != null ? _currentUser!.email! : 'Effettua il login!',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_currentUser != null) {
                     await FirebaseAuth.instance.signOut();
                     Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // L'utente non è loggato, esegui le azioni per il login
                    // Esempio: Naviga alla pagina di login
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: Text(
                  _currentUser != null ? 'LOGOUT' : 'LOGIN',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFB46060),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}