import 'package:flutter/material.dart';
import 'package:book_tique/screens/dettaglioScopri.dart';

class BookImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DettaglioLibroScopriPage(), // Passa la schermata di dettaglio come parametro
            ),
          );
        },
        child: Container(
          width: 88,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.bookmark,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}