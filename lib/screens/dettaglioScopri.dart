import 'package:flutter/material.dart';
import 'package:book_tique/models/book.dart';


class DettaglioLibroScopriPage extends StatelessWidget {
  final Book book;

  DettaglioLibroScopriPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4E0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30), // Imposta il margine superiore desiderato
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Torna indietro quando si preme il pulsante "Indietro"
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              book.thumbnailUrl,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              book.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              book.authors[0],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Azioni da eseguire quando si preme il pulsante "AGGIUNGI"
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFB46060),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text('AGGIUNGI'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Descrizione:',
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              book.description,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}