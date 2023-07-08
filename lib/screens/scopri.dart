import 'package:book_tique/screens/catalogoGeneri.dart';
import 'package:flutter/material.dart';
import 'package:book_tique/screens/bookImage.dart';

class ScopriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
              color: Colors.grey[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Cerca',
                          filled: true,
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nuove Uscite:',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 17,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: 140,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BookImage(),
                  BookImage(),
                  BookImage(),
                  BookImage(),
                  BookImage(),
                  BookImage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popolari 2023:',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 17,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: 140,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BookImage(),
                  BookImage(),
                  BookImage(),
                  BookImage(),
                  BookImage(),
                  BookImage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void navigateToCatalogoGeneri(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CatalogoGeneri(),
    ),
  );
}