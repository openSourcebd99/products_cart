import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'cart_page.dart';

import 'product_card.dart';
import 'congratulations_dialog.dart';

void main() {
  runApp(const Products());
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsPage(title: 'Product List'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.title});

  final String title;

  @override
  State<ProductsPage> createState() => ProductList();
}

class ProductList extends State<ProductsPage> {
  int _totalCounter = 0;
  List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'price': '100.00',
      'quantity': 0,
    },
    {
      'name': 'Product 2',
      'price': '200.00',
      'quantity': 0,
    },
    {
      'name': 'Product 3',
      'price': '300.00',
      'quantity': 0,
    },
    {
      'name': 'Product 4',
      'price': '400.00',
      'quantity': 0,
    },
    {
      'name': 'Product 5',
      'price': '500.00',
      'quantity': 0,
    },
    {
      'name': 'Product 6',
      'price': '600.00',
      'quantity': 0,
    },
    {
      'name': 'Product 7',
      'price': '700.00',
      'quantity': 0,
    },
  ];

  void _incrementCounter(int index) {
    setState(() {
      products[index]['quantity']++;
      _totalCounter++;
      if (products[index]['quantity'] == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // use the CongratulationsDialog widget
            return CongratulationsDialog(productName: products[index]['name']);
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: BootstrapContainer(
            fluid: false,
            children: products.asMap().entries.map((entry) {
              int idx = entry.key;
              Map<String, dynamic> product = entry.value;
              return ProductCard(
                name: product['name'],
                price: product['price'],
                quantity: product['quantity'].toString(),
                incrementCounter: () => _incrementCounter(idx),
              );
            }).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartPage(totalProducts: _totalCounter)),
            );
          },
          tooltip: 'Go To Cart',
          child: Icon(Icons.shopping_cart),
        ));
  }
}
