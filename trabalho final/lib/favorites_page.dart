import 'package:flutter/material.dart';
import 'food_item_model.dart';

class FavoritesPage extends StatelessWidget {
  final List<FoodItemModel> favoriteItems;

  const FavoritesPage(this.favoriteItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final food = favoriteItems[index];
          return ListTile(
            title: Text(food.name),
          );
        },
      ),
    );
  }
}
