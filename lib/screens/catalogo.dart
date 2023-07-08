
import 'package:book_tique/screens/bookImage.dart';
import 'package:book_tique/screens/catalogoGeneri.dart';
import 'package:book_tique/screens/impostazioni.dart';
import 'package:flutter/material.dart';
import 'package:book_tique/models/book.dart';

class CatalogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CATALOGO',
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 30,
                color: Color(0xFFFFBF9B),
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: Icon(
                Icons.account_circle,
                size: 32,
                color: Color(0xFFB46060)
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28),
              GestureDetector(
                onTap: () {
                  List<Book> listaDaLeggere = [];
                  _navigateToCatalogoGeneri(context, listaDaLeggere);
                },
                child: Text(
                  'Da leggere >',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 17,
                    color: Color(0xFFB46060),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
              SizedBox(height: 28),
              GestureDetector(
                onTap: () {
                  List<Book> listaInCorso = [];
                  _navigateToCatalogoGeneri(context, listaInCorso);
                },
                child: Text(
                  'In corso >',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 17,
                    color: Color(0xFFB46060),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
              SizedBox(height: 28),
              GestureDetector(
                onTap: () {
                  List<Book> listaLetti = [];
                  _navigateToCatalogoGeneri(context, listaLetti);
                },
                child: Text(
                  'Letti >',
                  style: TextStyle(
                    fontFamily: 'LoraBoldItalic',
                    fontSize: 17,
                    color: Color(0xFFB46060),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
      ),
    );
  }
  void _navigateToCatalogoGeneri(BuildContext context, List<Book> books) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CatalogoGeneri( books: books)),
    );
  }
}

