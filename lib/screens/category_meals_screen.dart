import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'meal_detail_sreen.dart';

import '../models/meal.dart';

class CategoryMealsScreeen extends StatefulWidget {
  static const routeName = "/category-meal";

  @override
  _CategoryMealsScreeenState createState() => _CategoryMealsScreeenState();
}

class _CategoryMealsScreeenState extends State<CategoryMealsScreeen> {
  String id;
  String title;
  List<Meal> meals;

  String complexityText(complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String affordabilityText(affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context, id) {
    Navigator.of(context)
        .pushNamed(
          MealDetailScreen.routeName,
          arguments: id,
        )
        .then((result) => {print(result)});
  }

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    id = routeArgs["id"];
    title = routeArgs["title"];
    meals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    print(meals.length);
    print('mealslength');

    var appBar = AppBar(
      title: Text(title),
    );
    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemBuilder: (BuildContext ctxt, int index) {
          return meal(context, meals, index);
        },
        itemCount: meals.length,
      ),
    );
  }

  InkWell meal(BuildContext context, List<Meal> meals, int index) {
    return InkWell(
      onTap: () {
        selectMeal(context, meals[index].id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: meals[index].id,
                    child: Image.network(
                      meals[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey.withOpacity(0.6),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      meals[index].title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meals[index].duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText(meals[index].affordability)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText(meals[index].complexity)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
