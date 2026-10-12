import 'package:flutter/material.dart';

/// Practical A4: Create a ListView.builder that displays a list of at least 10 fruit names.
class FruitListScreen extends StatelessWidget {
  const FruitListScreen({super.key});

  final List<String> fruits = const [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Grape',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Papaya',
    'Kiwi',
    'Blueberry',
    'Peach',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A4: Fruit List'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              title: Text(
                fruit,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected Fruit: $fruit')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
