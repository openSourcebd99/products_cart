// product_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'style.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String quantity;
  final VoidCallback incrementCounter;

  ProductCard({
    required this.name,
    required this.price,
    required this.quantity,
    required this.incrementCounter,
  });

  @override
  Widget build(BuildContext context) {
    return BootstrapRow(
      height: 60,
      children: <BootstrapCol>[
        BootstrapCol(
          sizes: 'col-6',
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name, style: titleStyle),
                SizedBox(height: 4),
                Text('\$ $price', style: descriptionStyle),
              ],
            ),
          ),
        ),
        BootstrapCol(
          sizes: 'col-6',
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text('Counter: $quantity'),
                SizedBox(height: 4),
                ElevatedButton(
                  onPressed: incrementCounter,
                  child: const Text('Buy Now'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
