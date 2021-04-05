import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final double price;
  final String imageUrl;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.blue,
    @required this.price,
    @required this.imageUrl,
  });
}
