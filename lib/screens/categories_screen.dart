import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(
              category.id,
              category.title,
              category.color,
              category.price,
              category.imageUrl,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 2 / 3,
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
