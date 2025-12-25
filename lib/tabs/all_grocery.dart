import 'package:flutter/material.dart';
import '../../../data/mock_grocery_repository.dart';
import '../../../models/grocery.dart';
import 'grocery_tabs.dart';

class AllGroceriesTab extends StatelessWidget {
  const AllGroceriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    if (dummyGroceryItems.isEmpty) {
      return const Center(child: Text('No items added yet.'));
    }
    return ListView.builder(
      itemCount: dummyGroceryItems.length,
      itemBuilder: (context, index) =>
          GroceryTile(grocery: dummyGroceryItems[index]),
    );
  }
}