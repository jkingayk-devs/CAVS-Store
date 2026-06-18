import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

const categories = {
  Categories.poultry: Category(
    'Fresh Poultry (Chicken)',
    Color.fromARGB(255, 255, 102, 102), // Reddish for Meat
  ),
  Categories.vegetables: Category(
    'Fresh Vegetables',
    Color.fromARGB(255, 0, 255, 128), // Bright Green
  ),
  Categories.fruits: Category(
    'Seasonal Fruits',
    Color.fromARGB(255, 255, 145, 0), // Orange
  ),
  Categories.organic: Category(
    'Organic Herbs',
    Color.fromARGB(255, 0, 200, 0), // Dark Green
  ),
  Categories.spices: Category(
    'Desi Spices',
    Color.fromARGB(255, 255, 187, 0), // Yellow
  ),
  Categories.other: Category(
    'Other Items',
    Color.fromARGB(255, 0, 225, 255), // Blue
  ),
};