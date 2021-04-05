import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      width: 300,
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments as String;
    var meal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    var appBar = AppBar(
      title: Text(meal.title),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 3,
                  color: Colors.amberAccent,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index])),
                );
              },
              itemCount: meal.ingredients.length,
            )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Steps',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '#${index + 1}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      title: Text('${meal.steps[index]}'),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
