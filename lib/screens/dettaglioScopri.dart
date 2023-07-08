import 'package:flutter/material.dart';


class DettaglioLibroScopriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Azioni da eseguire quando si preme il pulsante "Indietro"
                },
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/book_cover.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'TITOLO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 28,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Autore',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Azioni da eseguire quando si preme il pulsante "AGGIUNGI"
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('AGGIUNGI'),
            ),
            SizedBox(height: 15),
            Text(
              'Descrizione:',
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Descrizione del libro...',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}