import 'package:flutter/material.dart';
import 'package:book_tique/screens/dettaglioScopri.dart';

import '../models/book.dart';

class BookImage extends StatelessWidget {
  final Book book;

  const BookImage({required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToBookDetail(context, book);
      },
      child:Image.network(
        book.thumbnailUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  void navigateToBookDetail(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DettaglioLibroScopriPage(book: book),
      ),
    );
  }
}