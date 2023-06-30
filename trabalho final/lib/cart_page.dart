import 'package:flutter/material.dart';
import 'food_item_model.dart';

class CartPage extends StatelessWidget {
  final List<FoodItemModel> cartItems;
  final double subtotal;

  const CartPage(this.cartItems, this.subtotal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final food = cartItems[index];
          return ListTile(
            title: Text(food.name),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Finalizar Pedido'),
              onPressed: () {
                // Lógica para finalizar o pedido
              },
            ),
          ],
        ),
      ),
    );
  }
}
