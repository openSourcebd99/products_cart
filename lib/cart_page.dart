// cart_page.dart
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int totalProducts;

  CartPage({required this.totalProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total products: $totalProducts'),
      ),
    );
  }
}
