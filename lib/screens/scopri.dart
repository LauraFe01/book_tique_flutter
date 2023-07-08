import 'dart:convert';

import 'package:book_tique/screens/catalogoGeneri.dart';
import 'package:flutter/material.dart';
import 'package:book_tique/models/book.dart';
import 'package:http/http.dart' as http;


class ScopriPage extends StatefulWidget {
  @override
  _ScopriPageState createState() => _ScopriPageState();
}

class _ScopriPageState extends State<ScopriPage> {
  List<Book> newReleases = [];
  List<Book> popularBooks = [];

  @override
  void initState() {
    super.initState();
    fetchNewReleases();
    fetchPopularBooks();
  }

  Future<void> fetchNewReleases() async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=published:2022&orderBy=newest'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final items = jsonResponse['items'] as List<dynamic>;

      setState(() {
        newReleases = items.map((item) => Book.fromMap(item)).toList();
      });
    } else {
      print('Failed to fetch new releases. Error: ${response.statusCode}');
    }
  }

  Future<void> fetchPopularBooks() async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=published:2023&orderBy=relevance'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final items = jsonResponse['items'] as List<dynamic>;

      setState(() {
        popularBooks = items.map((item) => Book.fromMap(item)).toList();
      });
    } else {
      print('Failed to fetch popular books. Error: ${response.statusCode}');
    }
  }

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
            SizedBox(
              height: 140,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                itemCount: newReleases.length,
                itemBuilder: (context, index) {
                  final book = newReleases[index];
                  return BookImage(book: book);
                },
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
            SizedBox(
              height: 140,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                itemCount: popularBooks.length,
                itemBuilder: (context, index) {
                  final book = popularBooks[index];
                  return BookImage(book: book);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookImage extends StatelessWidget {
  final Book book;

  const BookImage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Image.network(book.thumbnailUrl);
  }
}