import 'package:flutter/material.dart';

/// Practical B9: Build a form screen that adapts its field layout (single column
/// vs two columns side by side) based on MediaQuery screen width.
class ResponsiveFormScreen extends StatefulWidget {
  const ResponsiveFormScreen({super.key});

  @override
  State<ResponsiveFormScreen> createState() => _ResponsiveFormScreenState();
}

class _ResponsiveFormScreenState extends State<ResponsiveFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('B9: Responsive MediaQuery Form'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Registration Form (Width: ${screenWidth.toInt()} dp)',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              if (isWide) ...[
                Row(
                  children: [
                    Expanded(child: _buildTextField('First Name')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('Last Name')),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildTextField('Email Address')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildTextField('Phone Number')),
                  ],
                ),
              ] else ...[
                _buildTextField('First Name'),
                const SizedBox(height: 16),
                _buildTextField('Last Name'),
                const SizedBox(height: 16),
                _buildTextField('Email Address'),
                const SizedBox(height: 16),
                _buildTextField('Phone Number'),
              ],
              const SizedBox(height: 16),
              _buildTextField('City / Address'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Submitted Successfully!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Submit Form', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
