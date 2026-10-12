import 'package:flutter/material.dart';

/// Practical A5: Build a GridView.count that displays 6 coloured boxes with 2 items per row.
class ColorGridScreen extends StatelessWidget {
  const ColorGridScreen({super.key});

  final List<Map<String, dynamic>> boxData = const [
    {'title': 'Red Box', 'color': Colors.red},
    {'title': 'Green Box', 'color': Colors.green},
    {'title': 'Blue Box', 'color': Colors.blue},
    {'title': 'Yellow Box', 'color': Colors.amber},
    {'title': 'Orange Box', 'color': Colors.deepOrange},
    {'title': 'Purple Box', 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A5: 2-Column Color Grid'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: boxData.map((item) {
            return Container(
              decoration: BoxDecoration(
                color: item['color'] as Color,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  item['title'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
