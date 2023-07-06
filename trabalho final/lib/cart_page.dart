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
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final food = cartItems[index];
          return ListTile(
            leading: Image.asset(
              food.imagePath,
              width: 48.0,
              height: 48.0,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(food.name),
                Text('Quantidade: ${food.quantity.toString()}'),
              ],
            ),
            subtitle: Text(
                'Valor: R\$ ${(food.price * food.quantity).toStringAsFixed(2)}'),
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
            SizedBox(
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Finalizar Pedido'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
