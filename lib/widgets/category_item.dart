import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import 'dart:math';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  final double price;
  final String imageUrl;

  CategoryItem(
    this.id,
    this.title,
    this.color,
    this.price,
    this.imageUrl,
  );

  void onCategorySelect(BuildContext context) {
    Navigator.pushNamed(context, CategoryMealsScreeen.routeName,
        arguments: <String, String>{
          'id': id,
          'title': title,
        });
  }

  Widget _buildCircleAvatar(String imageUrl) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 1, constraints.maxWidth / 2);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        onCategorySelect(context),
      },
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildCircleAvatar(imageUrl),
            Flexible(
              child: Text(
                this.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    widthFactor: 1.6,
                    alignment: Alignment.topCenter,
                    heightFactor: 1.4,
                    child: Text(
                      '£',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                  ),
                  Text(
                    "${this.price}0",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: IconButton(
                alignment: Alignment.bottomCenter,
                icon: const Icon(Icons.add_circle),
                //iconSize: 35,
                color: Colors.purple,
                onPressed: () {},
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          // gradient: LinearGradient(
          //   colors: [
          //     color,
          //     color.withOpacity(0.5),
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
