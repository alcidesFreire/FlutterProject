import 'package:flutter/material.dart';
import 'package:mobile_project/services/cart/cart_service.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartService>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart (${cart.length})"),
      ),
      body: ListView(
        children: cart
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text("USD " + (e.price ?? '')),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    context.read<CartService>().removeFromCart(e);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
