import 'package:flutter/material.dart';
import 'categories_screen.dart';
import '../widgets/main_drawer.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite',
    }
  ];

  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabSelected,
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
