import 'package:flutter/material.dart';
import '../../../data/mock_grocery_repository.dart';
import '../../../models/grocery.dart';
import 'grocery_tabs.dart';

class SearchGroceriesTab extends StatefulWidget {
  const SearchGroceriesTab({super.key});

  @override
  State<SearchGroceriesTab> createState() => _SearchGroceriesTabState();
}

class _SearchGroceriesTabState extends State<SearchGroceriesTab> {
  final TextEditingController _searchController = TextEditingController();
  List<Grocery> _filteredGroceries = [];

  @override
  void initState() {
    super.initState();
    _filteredGroceries = List.from(dummyGroceryItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredGroceries = List.from(dummyGroceryItems);
      } else {
        _filteredGroceries = dummyGroceryItems
            .where((grocery) =>
                grocery.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _searchController,
            onChanged: onSearch,
            decoration: InputDecoration(
              hintText: 'Search groceries...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        Expanded(
          child: _filteredGroceries.isEmpty
              ? const Center(child: Text('No matching items found.'))
              : ListView.builder(
                  itemCount: _filteredGroceries.length,
                  itemBuilder: (context, index) =>
                      GroceryTile(grocery: _filteredGroceries[index]),
                ),
        ),
      ],
    );
  }
}