import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:book_tique/models/book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/Utente.dart';
import 'package:logger/logger.dart';

class DettaglioLibroScopriPage extends StatefulWidget {
  final Book book;

  DettaglioLibroScopriPage({required this.book});

  @override
  _DettaglioLibroScopriPageState createState() => _DettaglioLibroScopriPageState();
}

class _DettaglioLibroScopriPageState extends State<DettaglioLibroScopriPage> {
  bool aggiunto = false;

  @override
  void initState() {
    super.initState();
    checkPresenza();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4E0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              widget.book.thumbnailUrl,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              widget.book.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'LoraBoldItalic',
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.book.authors[0],
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
                onPressed: aggiunto ? (){
                  spostaLibro(widget.book);
                } : () {
                  aggiungiLibro(widget.book);
                },
                style: ElevatedButton.styleFrom(
                  primary: aggiunto ? Color(0xFFB46060) : Color(0xFFB46060),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text(aggiunto ? 'SPOSTA' : 'AGGIUNGI'),
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
              widget.book.description,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> aggiungiLibro(Book book) async {
    Libro libro = Libro(
      titolo: book.title,
      autori: book.authors.isNotEmpty ? book.authors : [],
      descrizione: book.description,
      id: book.id,
      copertina: book.thumbnailUrl,
      stato: "Da leggere",
    );

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final database = FirebaseDatabase(
        databaseURL: 'https://booktiqueflut-default-rtdb.europe-west1.firebasedatabase.app/',
      );

      DatabaseReference usersRef = database.ref().child("Utenti");
      DatabaseReference userRef = usersRef.child(userId);
      print("User ID: $userId");
      log("User ID: $userId");
      DatabaseReference catalogoRef = userRef.child('Catalogo');
      log("catalogo: $catalogoRef");

      await catalogoRef.child(book.id).set(libro.toJson());
      setState(() {
        aggiunto = true;
      });
    } else {
      // Handle the case when the user is not logged in
    }
  }

  Future<void> checkPresenza() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final database = FirebaseDatabase(databaseURL: 'https://booktiqueflut-default-rtdb.europe-west1.firebasedatabase.app/');
      FirebaseDatabase.instance.setPersistenceEnabled(true);
      FirebaseDatabase.instance.ref().keepSynced(true);
      DatabaseReference usersRef = database.ref().child("Utenti");
      DatabaseReference userRef = usersRef.child(userId);
      DatabaseReference catalogoRef = userRef.child('Catalogo');

      catalogoRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        log("data: $data");
        if (data != null) {
          data.forEach((key, value) {
            log("Book ID: $key");
            log("Object Data: $value");
            if (widget.book.id == key) {
              setState(() {
                aggiunto = true;
              });
              return;
            }
          });
        }
      });
    } else {
      // Handle the case when the user is not logged in
    }
  }

  Future<void> spostaLibro(Book book) async{
    Libro libro = Libro(
      titolo: book.title,
      autori: book.authors.isNotEmpty ? book.authors : [],
      descrizione: book.description,
      id: book.id,
      copertina: book.thumbnailUrl,
      stato: "Da leggere",
    );

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final database = FirebaseDatabase(
        databaseURL: 'https://booktiqueflut-default-rtdb.europe-west1.firebasedatabase.app/',
      );

      DatabaseReference usersRef = database.ref().child("Utenti");
      DatabaseReference userRef = usersRef.child(userId);
      print("User ID: $userId");
      log("User ID: $userId");
      DatabaseReference catalogoRef = userRef.child('Catalogo');
      log("catalogo: $catalogoRef");

      await catalogoRef.child(book.id).set(libro.toJson());
      setState(() {
        aggiunto = true;
      });
    } else {
      // Handle the case when the user is not logged in
    }
  }

}