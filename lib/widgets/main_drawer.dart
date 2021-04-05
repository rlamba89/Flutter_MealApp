import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';

Widget buildListTile(String title, IconData icon, Function onTap) {
  return ListTile(
    leading: Icon(
      icon,
      size: 26,
    ),
    onTap: onTap,
    title: Text(title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )),
  );
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amberAccent,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () => {
              Navigator.of(context).pushReplacementNamed(CategoriesScreen.routeName)
            }
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () => {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName)
            }
          ),
        ],
      ),
    );
  }
}
