import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  const CartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.bhinneka.com/blog/wp-content/uploads/2021/10/Cumal-Cemil-Paper-Pouch-Packaging-Mockup-1536x1152.jpg')),
      ),
    );
  }
}
