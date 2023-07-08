import 'package:flutter/material.dart';
import 'package:book_tique/screens/libriGenere.dart';

class CatalogoGeneri extends StatelessWidget {
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
            // Azioni da eseguire quando si preme il pulsante indietro
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Numero di elementi nella lista (esempio: 10)
        itemBuilder: (context, index) {
          return LibriGenere(); // Utilizza il layout dell'elemento della RecyclerView
        },
      ),
    );
  }
}