import 'package:flutter/material.dart';
import 'package:BookTique/screens/ImpostazioniPage.dart';
import 'package:BookTique/screens/ScopriPage.dart';
import 'package:BookTique/screens/CatalogoPage.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    CatalogoPage(),
    ScopriPage(),
    ImpostazioniPage(),
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