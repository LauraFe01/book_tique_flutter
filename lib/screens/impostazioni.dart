
import 'package:flutter/material.dart';
import 'package:book_tique/screens/login.dart';

class ImpostazioniScreen extends StatelessWidget {
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
                'Username',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  'LOGIN',
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