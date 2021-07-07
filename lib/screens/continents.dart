import 'package:flutter/material.dart';
import 'continents_screen.dart';
import 'favourites.dart';
import 'main_drawer.dart';

class Continents extends StatefulWidget {
  @override
  _ContinentsState createState() => _ContinentsState();
}

class _ContinentsState extends State<Continents> {
  int _selectedPage = 0;
  final _pageOptions = [ContinentsScreen(), Favourites()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Continents'),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: SizedBox(
        height: 58,
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorite'),
          ],
          selectedItemColor: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
