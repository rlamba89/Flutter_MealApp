import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_sreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        canvasColor: Colors.white,
      ),
      routes: {
        //CategoriesScreen.routeName: (_) => CategoriesScreen(),
        TabsScreen.routeName: (_) => TabsScreen(),
        CategoryMealsScreeen.routeName: (_) => CategoryMealsScreeen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(),
      },
    );
  }
}
