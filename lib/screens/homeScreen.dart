import 'package:flutter/material.dart';
import 'package:book_tique/screens/impostazioni.dart';
import 'package:book_tique/screens/scopri.dart';
import 'package:book_tique/screens/catalogo.dart';


class CatalogoHome extends StatefulWidget {
  @override
  _CatalogoHomeState createState() => _CatalogoHomeState();
}

class _CatalogoHomeState extends State<CatalogoHome> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CatalogoPage(),
    ScopriPage(),
    ImpostazioniScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        selectedItemColor: Color(0xFFB46060),
        unselectedItemColor: Color(0xFFFFBF9B),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Catalogo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Scopri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Impostazioni',
          ),
        ],
      ),
    );
  }
}