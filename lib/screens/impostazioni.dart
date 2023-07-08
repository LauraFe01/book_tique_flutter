
import 'package:flutter/material.dart';

class ImpostazioniScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMPOSTAZIONI'),
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 48),
              Image.asset(
                'assets/profile_circle_icon.png',
                width: 99,
                height: 91,
              ),
              SizedBox(height: 15),
              Text(
                'Username',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Azioni da eseguire quando si preme il pulsante "MODIFICA"
                    },
                    child: Text(
                      'MODIFICA',
                      style: TextStyle(
                        fontFamily: 'LoraBoldItalic',
                        fontSize: 20,
                        color: Colors.grey[800],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[200],
                      onPrimary: Colors.grey[800],
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Azioni da eseguire quando si preme il pulsante "LOGOUT"
                    },
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(
                        fontFamily: 'LoraBoldItalic',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}