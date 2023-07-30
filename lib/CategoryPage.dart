import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<String> categoryItems;

  CategoryPage({required this.category, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryItems[index]),
            // You can add more content here as needed
          );
        },
      ),
    );
  }
}
