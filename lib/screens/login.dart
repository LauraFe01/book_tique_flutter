import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xFFFCECD8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BOOKTIQUE',
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 180),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'EMAIL:',
                labelStyle: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'PASSWORD:',
                labelStyle: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              obscureText: true,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 52),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFB46060),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              ),
            ),
            SizedBox(height: 28),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/register');
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
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Login avvenuto con successo, esegui altre azioni necessarie qui
    } catch (e) {
      // Gestisci l'errore durante il login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Errore di accesso'),
          content: Text('Si è verificato un errore durante l\'accesso.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}