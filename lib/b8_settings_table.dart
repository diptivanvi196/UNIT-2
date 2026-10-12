import 'package:flutter/material.dart';

/// Practical B8: Create a settings screen using a Table widget to display
/// label-value pairs in aligned rows and columns.
class SettingsTableScreen extends StatelessWidget {
  const SettingsTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B8: Settings Table Widget'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Configuration Table:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(color: Colors.blueGrey.shade200, width: 1),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                _buildTableRow('Setting Label', 'Setting Value', isHeader: true),
                _buildTableRow('App Name', 'MAD Practicals App'),
                _buildTableRow('Version', '2.6.0-build.8'),
                _buildTableRow('Developer', 'Dipti Patel'),
                _buildTableRow('Environment', 'Production'),
                _buildTableRow('Theme Mode', 'System Default'),
                _buildTableRow('Notifications', 'Enabled'),
                _buildTableRow('Cache Size', '45.8 MB'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blueGrey.shade100 : Colors.white,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.w600,
              fontSize: isHeader ? 16 : 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: isHeader ? 16 : 14,
              color: isHeader ? Colors.black : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
