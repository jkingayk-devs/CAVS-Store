import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CAVs Store - Fresh Dropshipping',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 34, 139, 34), // Forest Green for Vegetables
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 25, 35, 25), // Dark greenish surface
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 25, 18),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 34, 139, 34),
          foregroundColor: Colors.white,
        ),
      ),
      home: const GroceryList(),
    );
  }
}