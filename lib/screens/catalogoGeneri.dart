import 'package:flutter/material.dart';
import 'package:book_tique/screens/libriGenere.dart';
import 'package:book_tique/models/book.dart';

class CatalogoGeneri extends StatelessWidget {
  final List<Book> books;

  CatalogoGeneri({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 4,
        toolbarHeight: 56,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Azioni da eseguire quando si preme il pulsante indietro
          },
        ),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return LibriGenere(book: book);
        },
      ),
    );
  }
}