import 'package:flutter/material.dart';
import 'package:book_tique/screens/registrazione.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFCECD8),
        child: Center(
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
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
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
              ),
              SizedBox(height: 52),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Inserisci la password',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontFamily: 'LoraBoldItalic',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Azioni da eseguire quando si preme il pulsante "LOGIN"
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFB46060),
                  onPrimary: Colors.grey[800],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 28),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrazione()),
                  );
                },
                child: Text(
                  'NON HAI UN ACCOUNT? REGISTRATI QUI',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 16,
                    color: Color(0xFFB46060),
                  ),
                ),
              ),
              SizedBox(height: 48),
              // Aggiunto spazio aggiuntivo tra il contenuto e il bordo superiore
            ],
          ),
        ),
      ),
    );
  }
}