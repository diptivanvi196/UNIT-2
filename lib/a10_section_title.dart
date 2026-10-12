import 'package:flutter/material.dart';

/// Practical A10: Create a custom widget called `SectionTitle` that displays
/// styled heading text, and reuse it on two different screens.

class SectionTitle extends StatelessWidget {
  final String title;
  final Color titleColor;

  const SectionTitle({
    super.key,
    required this.title,
    this.titleColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            color: titleColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitleDemoScreen extends StatelessWidget {
  const SectionTitleDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A10: Custom SectionTitle Demo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screen 1 Demo
            const SectionTitle(title: 'Screen 1: User Overview'),
            const Card(
              child: ListTile(
                leading: Icon(Icons.account_circle, size: 40),
                title: Text('John Doe'),
                subtitle: Text('Software Developer'),
              ),
            ),
            const SizedBox(height: 24),
            // Screen 2 Demo (Reuse)
            const SectionTitle(
              title: 'Screen 2: Settings & Security',
              titleColor: Colors.deepOrange,
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.lock, size: 40),
                title: Text('Password & Privacy'),
                subtitle: Text('Manage security settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
