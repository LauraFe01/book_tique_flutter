import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                // Azione da eseguire quando si preme il pulsante di login
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
}