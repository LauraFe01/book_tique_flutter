import 'package:flutter/material.dart';
import '../auth.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
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
            SizedBox(height: 76),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'USERNAME:',
                labelStyle: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'EMAIL:',
                labelStyle: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 36),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'PASSWORD:',
                labelStyle: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              obscureText: true,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 76),
            ElevatedButton(
              onPressed: () {
                _register(context);
              },
              child: Text(
                'REGISTRATI',
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
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
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
    );
  }

  void _register(BuildContext context) async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // Registrazione avvenuta con successo, esegui altre azioni necessarie qui
    } catch (e) {
      // Gestisci l'errore durante la registrazione
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Errore di registrazione'),
          content: Text('Si è verificato un errore durante la registrazione.'),
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