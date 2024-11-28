import 'package:flutter/material.dart';

void main() {
  runApp(SimpleFlutterApp());
}

class SimpleFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}


class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Home Screen 
class HomeScreen extends StatelessWidget {
  //  list of products
  final List<Product> products = [
    Product(
      name: 'Smartphone',
      description: 'A high-end smartphone with a great camera.',
      price: 999.99,
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
    ),
    Product(
      name: 'Headphones',
      description: 'Noise-cancelling over-ear headphones.',
      price: 199.99,
      imageUrl:
          'https://images.unsplash.com/photo-1511367461989-f85a21fda167',
    ),
    Product(
      name: 'Laptop',
      description: 'Lightweight laptop with powerful performance.',
      price: 1299.99,
      imageUrl:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Detail Screen displaying more information about the product
class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To ensure responsiveness, use a ScrollView
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Center(
                  child: Image.network(
                    product.imageUrl,
                    width: constraints.maxWidth * 0.8,
                    height: constraints.maxWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                // Product Name
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Product Price
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[700],
                  ),
                ),
                SizedBox(height: 20),
                // Product Description
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                // Add more details as needed
              ],
            ),
          );
        },
      ),
    );
  }
}
