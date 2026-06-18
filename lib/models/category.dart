import 'package:flutter/material.dart';

// CAVs Store Categories
enum Categories {
  poultry,
  vegetables,
  fruits,
  organic,
  spices,
  other,
}

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}