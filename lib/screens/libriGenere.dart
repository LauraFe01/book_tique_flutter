import 'package:flutter/material.dart';
import 'package:book_tique/models/book.dart';
import 'package:book_tique/screens/dettaglioScopri.dart';

class LibriGenere extends StatelessWidget {
  final Book book;

  LibriGenere({required this.book});

  // Funzione di abbreviazione del titolo
  String abbreviaTitolo(String titolo, int lunghezzaMassima) {
    if (titolo.length <= lunghezzaMassima) {
      return titolo;
    } else {
      return titolo.substring(0, lunghezzaMassima) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Abbrevia il titolo del libro
    final String abbreviatedTitle = abbreviaTitolo(book.title, 20);

    return GestureDetector(
      onTap: () {
        navigateToDettaglioLibro(context, book);
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Color(0xFFFFF4E0),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                width: 88,
                height: 140,
                child: Image.network(
                  book.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    abbreviatedTitle, // Utilizza il titolo abbreviato
                    style: TextStyle(
                      fontFamily: 'Lora-BoldItalic',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    book.authors.toString(),
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDettaglioLibro(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DettaglioLibroScopriPage(book: book),
      ),
    );
  }
}