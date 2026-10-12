import 'package:flutter/material.dart';

/// Practical A1: Create a StatelessWidget that displays your name, college name,
/// and course in three separate Text widgets arranged in a Column.
class InfoColumnScreen extends StatelessWidget {
  const InfoColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A1: Info Column'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.indigo.shade200),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Name: Dipti Patel',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'College: Government Engineering College',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 12),
              Text(
                'Course: Master of Computer Applications (MCA)',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
