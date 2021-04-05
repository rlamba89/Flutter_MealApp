import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false,
      _veganFree = false,
      _vegetarian = false,
      _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subTitle, bool value, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        activeColor: Colors.green,
        subtitle: Text(subTitle),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                "Gluten Free",
                "Only include gluten-free meals.",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegan Free",
                "Only include vegan-free meals.",
                _veganFree,
                (newValue) {
                  setState(() {
                    _veganFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "Only include vegetarian meals.",
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Lactose Free",
                "Only include lactose-free meals.",
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
