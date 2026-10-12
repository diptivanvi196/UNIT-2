import 'package:flutter/material.dart';

/// Practical B3: Design a product listing screen using GridView.builder
/// with an image, name, and price for each product card.
class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {'name': 'Wireless Headphones', 'price': '\$99.99', 'icon': Icons.headphones},
    {'name': 'Smart Watch', 'price': '\$149.99', 'icon': Icons.watch},
    {'name': 'Bluetooth Speaker', 'price': '\$59.99', 'icon': Icons.speaker},
    {'name': 'Laptop Stand', 'price': '\$29.99', 'icon': Icons.laptop},
    {'name': 'Gaming Mouse', 'price': '\$45.00', 'icon': Icons.mouse},
    {'name': 'Mechanical Keyboard', 'price': '\$89.99', 'icon': Icons.keyboard},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B3: Product GridView.builder'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = products[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      size: 48,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item['name'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['price'] as String,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
