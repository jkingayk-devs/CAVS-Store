import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Jab app me koi data na ho toh yeh message show hoga
    Widget content = const Center(
      child: Text(
        'Stock is empty. Add new vendor items!',
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          background: Container(
            color: Colors.red.withOpacity(0.8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            title: Text(
              _groceryItems[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            leading: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _groceryItems[index].category.color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // Yahan hum ne unit ko kg/dz me change kar diya hai
            trailing: Text(
              '${_groceryItems[index].quantity} kg / dz',
              style: const TextStyle(fontSize: 15, color: Colors.white70),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CAVs - Live Stock Inventory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add_business), // Icon change kiya hai
            tooltip: 'Add Vendor Stock',
          ),
        ],
      ),
      body: content,
    );
  }
}