import 'package:flutter/material.dart';
import 'package:book_tique/screens/login.dart';

class Registrazione extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFCECD8),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BOOKTIQUE',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Inserisci l\'username',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontFamily: 'LoraBoldItalic',
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Inserisci l\'indirizzo email',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontFamily: 'LoraBoldItalic',
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Inserisci la password',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontFamily: 'LoraBoldItalic',
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Azioni da eseguire quando si preme il pulsante "REGISTRATI"
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFB46060),
                    onPrimary: Colors.grey[800],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text(
                    'REGISTRATI',
                    style: TextStyle(
                      fontFamily: 'LoraBoldItalic',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'HAI GIA UN ACCOUNT? ACCEDI QUI',
                    style: TextStyle(
                      fontFamily: 'LoraBoldItalic',
                      fontSize: 16,
                      color: Color(0xFFB46060),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}