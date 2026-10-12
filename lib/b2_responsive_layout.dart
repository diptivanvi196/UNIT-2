import 'package:flutter/material.dart';

/// Practical B2: Create a responsive layout that shows a Column on mobile width
/// and a Row on tablet/desktop width, using LayoutBuilder.
class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B2: Responsive LayoutBuilder'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          final widgets = [
            Expanded(
              flex: isMobile ? 0 : 1,
              child: Container(
                height: isMobile ? 120 : double.infinity,
                margin: const EdgeInsets.all(8),
                color: Colors.teal.shade300,
                child: const Center(
                  child: Text(
                    'Panel 1',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: isMobile ? 0 : 1,
              child: Container(
                height: isMobile ? 120 : double.infinity,
                margin: const EdgeInsets.all(8),
                color: Colors.orangeAccent,
                child: const Center(
                  child: Text(
                    'Panel 2',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Width: ${constraints.maxWidth.toStringAsFixed(1)} dp (${isMobile ? "Mobile: Column" : "Tablet/Desktop: Row"})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: isMobile
                      ? Column(children: widgets)
                      : Row(children: widgets),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
