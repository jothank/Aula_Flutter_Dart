import 'package:flutter/material.dart';
import 'food_item_model.dart';
import 'food_item_card.dart';
import 'food_details_page.dart';
import 'cart_page.dart';
import 'favorites_page.dart';

class FoodSelectionPage extends StatefulWidget {
  @override
  _FoodSelectionPageState createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  List<FoodItemModel> foods = [
    FoodItemModel(
      name: 'Hambúrguer',
      description: 'Delicioso hambúrguer com queijo e bacon.',
      price: 15.99,
      imagePath: 'images/hamburger.png',
      isFavorite: false,
    ),
    FoodItemModel(
      name: 'Pizza',
      description: 'Pizza de mussarela com tomate e orégano.',
      price: 12.99,
      imagePath: 'images/pizza.png',
      isFavorite: false,
    ),
    FoodItemModel(
      name: 'Sushi',
      description: 'Sushi variado com peixe fresco.',
      price: 22.99,
      imagePath: 'images/sushi.png',
      isFavorite: false,
    ),
    FoodItemModel(
      name: 'Salada',
      description: 'Salada fresca com mix de folhas e legumes.',
      price: 8.99,
      imagePath: 'images/salad.png',
      isFavorite: false,
    ),
    FoodItemModel(
      name: 'Tacos',
      description: 'Tacos mexicanos com carne e molho apimentado.',
      price: 17.99,
      imagePath: 'images/tacos.png',
      isFavorite: false,
    ),
    FoodItemModel(
      name: 'Massa',
      description: 'Deliciosa massa com molho de tomate e queijo.',
      price: 10.99,
      imagePath: 'images/pasta.png',
      isFavorite: false,
    ),
  ];

  List<FoodItemModel> cartItems = [];
  double subtotal = 0.0;

  void addToCart(FoodItemModel food) {
    setState(() {
      cartItems.add(food);
      subtotal += food.price;
    });
  }

  void removeFromCart(FoodItemModel food) {
    setState(() {
      cartItems.remove(food);
      subtotal -= food.price;
    });
  }

  void toggleFavorite(FoodItemModel food) {
    setState(() {
      food.isFavorite = !food.isFavorite;
    });
  }

  List<FoodItemModel> getFavoriteItems() {
    return foods.where((food) => food.isFavorite).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Comidas'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems, subtotal),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              List<FoodItemModel> favoriteItems = getFavoriteItems();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(favoriteItems),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailsPage(food),
                ),
              );
            },
            child: FoodItemCard(
              food: food,
              addToCart: addToCart,
              removeFromCart: removeFromCart,
              toggleFavorite: toggleFavorite,
            ),
          );
        },
      ),
    );
  }
}
