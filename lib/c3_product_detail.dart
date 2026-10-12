import 'package:flutter/material.dart';

/// Practical C3: Design an e-commerce style product detail screen using Stack
/// for the image with an overlay discount badge, Wrap for tag chips, and
/// Expanded/Flexible for the price and Add-to-Cart button row.
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  final List<String> tags = const [
    'Electronics',
    'Wireless',
    'Noise Cancelling',
    'Bluetooth 5.3',
    'Best Seller',
    'Free Shipping',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C3: E-Commerce Product Detail'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stack for image + overlay discount badge
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        child: Image.network(
                          'https://picsum.photos/600/400?tech',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Icon(Icons.headphones, size: 100, color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '25% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pro Wireless Noise-Cancelling Headphones',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        // Wrap for tag chips
                        const Text('Product Tags:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: tags.map((tag) {
                            return Chip(
                              label: Text(tag, style: const TextStyle(fontSize: 12)),
                              backgroundColor: Colors.deepPurple.shade50,
                              side: BorderSide(color: Colors.deepPurple.shade200),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Description:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Immerse yourself in crystal clear sound with active noise cancellation, long 30-hour battery life, and ergonomic earcups designed for all-day comfort.',
                          style: TextStyle(color: Colors.black87, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded / Flexible row for Price & Add to Cart
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -3)),
              ],
            ),
            child: Row(
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Price', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text('\$199.99', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to Cart!')),
                      );
                    },
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
