import 'package:flutter/material.dart';
import '../auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/Utente.dart';
import 'LoginPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
        User? user = userCredential.user;
        if (user != null) {
          final database = FirebaseDatabase(databaseURL: 'https://booktiqueflut-default-rtdb.europe-west1.firebasedatabase.app/');
          FirebaseDatabase.instance.setPersistenceEnabled(true);
          FirebaseDatabase.instance.ref().keepSynced(true);
          DatabaseReference usersRef = database.ref().child("Utenti");
          DatabaseReference userRef = usersRef.child(user.uid);
          Utente utente = Utente(
            email: email,
            password: password,
            username: username,
            catalogo: Catalogo(libri: []),
          );
          userRef.set(utente.toJson()).then((_) {
            Fluttertoast.showToast(
              msg: 'Creazione avvenuta con successo!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey[800],
              textColor: Colors.white,
            );
            Navigator.pushReplacementNamed(context, '/home');
          }).catchError((error) {
            // Gestisci l'errore durante la creazione del nodo utente nel database
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Errore durante la registrazione'),
                content: Text('Si è verificato un errore durante la creazione del nodo utente nel database.'),
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
          });
        }
      } catch (e) {
      // Gestisci l'errore durante la registrazione
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Errore di registrazione'),
          content: Text('Si è verificato un errore durante la registrazione: $e'),
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