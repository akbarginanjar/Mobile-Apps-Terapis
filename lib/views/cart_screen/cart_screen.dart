import 'package:terapis/views/cart_screen/cart_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            alignment: Alignment.centerRight,
            color: Colors.white,
            padding: const EdgeInsets.only(right: 20),
            iconSize: 26,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: index == 0 ? 4.0 : 0, bottom: 4.0),
          child: const CartCard(),
        ),
      ),
    );
  }
}
