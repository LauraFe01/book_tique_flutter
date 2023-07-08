import 'package:flutter/material.dart';

class CatalogoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CATALOGO',
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                // Azioni da eseguire quando si preme il pulsante del profilo
              },
              icon: Icon(
                Icons.account_circle,
                size: 32,
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
              Text(
                'Da leggere >',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 20,
                  color: Colors.red,
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
              Text(
                'In corso >',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 20,
                  color: Colors.red,
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
              Text(
                'Letti >',
                style: TextStyle(
                  fontFamily: 'LoraBoldItalic',
                  fontSize: 20,
                  color: Colors.red,
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
}

class BookImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: GestureDetector(
        onTap: () {
          // Azioni da eseguire quando si seleziona un libro
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