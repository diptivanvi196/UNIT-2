import 'package:flutter/material.dart';

/// Practical A3: Design a screen using Scaffold with an AppBar, a body Text,
/// and a floating action button.
class ScaffoldFabScreen extends StatelessWidget {
  const ScaffoldFabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A3: Scaffold & FAB Demo'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'This is the body text inside a Scaffold widget.\nTap the Floating Action Button below!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Floating Action Button Clicked!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.touch_app),
        label: const Text('Click Me'),
      ),
    );
  }
}
