
import 'dart:developer';

import 'package:BookTique/screens/BookImage.dart';
import 'package:BookTique/screens/ListaLibri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:BookTique/models/book.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  List<Book> listaDaLeggere = [];
  List<Book> listaInCorso = [];
  List<Book> listaLetti = [];

  @override
  void initState() {
    super.initState();
    fillBooks();
  }

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
                final currentUser = FirebaseAuth.instance.currentUser;
                if (currentUser != null) {
                  Navigator.pushNamed(context, '/impostazioni');
                } else {
                  // Utente non loggato, vai alla schermata di login
                  Navigator.pushNamed(context, '/login');
                }
              },
              icon: Icon(
                Icons.account_circle,
                size: 32,
                color: Color(0xFFB46060),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
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
              Container(
                color: Color(0xC5FFBF9B),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 140,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: listaDaLeggere.length,
                      itemBuilder: (context, index) {
                        final book = listaDaLeggere[index];
                        log("listaDaLeggere: $listaDaLeggere");
                        return BookImage(book: book);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28),
              GestureDetector(
                onTap: () {
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
              Container(
                color: Color(0xC5FFBF9B),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 140,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: listaInCorso.length,
                      itemBuilder: (context, index) {
                        final book = listaInCorso[index];
                        return BookImage(book: book);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28),
              GestureDetector(
                onTap: () {
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
              Container(
                color: Color(0xC5FFBF9B),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 140,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: listaLetti.length,
                      itemBuilder: (context, index) {
                        final book = listaLetti[index];
                        return BookImage(book: book);
                      },
                    ),
                  ),
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
      MaterialPageRoute(builder: (context) => ListaLibri(books: books)),
    );
  }

  void fillBooks() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final database = FirebaseDatabase(
          databaseURL: 'https://booktiqueflut-default-rtdb.europe-west1.firebasedatabase.app/');
      FirebaseDatabase.instance.setPersistenceEnabled(true);
      FirebaseDatabase.instance.ref().keepSynced(true);
      DatabaseReference usersRef = database.ref().child("Utenti");
      DatabaseReference userRef = usersRef.child(userId);
      DatabaseReference catalogoRef = userRef.child('Catalogo');

      catalogoRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        log("data: $data");
        List<Book> updatedListaDaLeggere = [];
        List<Book> updatedListaInCorso = [];
        List<Book> updatedListaLetti = [];
        if (data != null) {
          data.forEach((key, value) {
            // Access the identifier (book ID) of each object
            log("Book ID: $key");
            // Access the object data using 'value' variable
            log("Object Data: $value");
            if (value['stato'] == "Da leggere") {
              Book book = Book(
                id: key,
                title: value['titolo'],
                authors: List<String>.from(value['autori']),
                thumbnailUrl: value['copertina'],
                description: value['descrizione'],
              );
              updatedListaDaLeggere.add(book);
            }
            if (value['stato'] == "In corso") {
              Book book = Book(
                id: key,
                title: value['titolo'],
                authors: List<String>.from(value['autori']),
                thumbnailUrl: value['copertina'],
                description: value['descrizione'],
              );
              updatedListaInCorso.add(book);
            }
            if (value['stato'] == "Letti") {
              Book book = Book(
                id: key,
                title: value['titolo'],
                authors: List<String>.from(value['autori']),
                thumbnailUrl: value['copertina'],
                description: value['descrizione'],
              );
              updatedListaLetti.add(book);
            }
          });
        }

        setState(() {
          listaDaLeggere = updatedListaDaLeggere;
          listaInCorso = updatedListaInCorso;
          listaLetti = updatedListaLetti;
        });
      });
    } else {
      // L'utente non è loggato
      // Esegui qui le azioni necessarie (es. visualizza un messaggio di errore)
    }
  }
}