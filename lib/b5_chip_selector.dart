import 'package:flutter/material.dart';

/// Practical B5: Create a tag/skill selector screen using the Wrap widget
/// where tapped Chips toggle a selected state.
class ChipSelectorScreen extends StatefulWidget {
  const ChipSelectorScreen({super.key});

  @override
  State<ChipSelectorScreen> createState() => _ChipSelectorScreenState();
}

class _ChipSelectorScreenState extends State<ChipSelectorScreen> {
  final List<String> _allSkills = [
    'Flutter',
    'Dart',
    'Android',
    'Kotlin',
    'Java',
    'Firebase',
    'REST API',
    'Git',
    'UI/UX Design',
    'GraphQL',
    'SQLite',
    'State Management',
  ];

  final Set<String> _selectedSkills = {'Flutter', 'Dart'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B5: Skill Chip Selector'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Your Skills:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _allSkills.map((skill) {
                final isSelected = _selectedSkills.contains(skill);
                return FilterChip(
                  label: Text(skill),
                  selected: isSelected,
                  selectedColor: Colors.pinkAccent.shade100,
                  checkmarkColor: Colors.pinkAccent,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSkills.add(skill);
                      } else {
                        _selectedSkills.remove(skill);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const Divider(height: 32),
            Text(
              'Selected (${_selectedSkills.length}):',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _selectedSkills.isEmpty
                  ? 'No skills selected'
                  : _selectedSkills.join(', '),
              style: const TextStyle(fontSize: 16, color: Colors.pinkAccent),
            ),
          ],
        ),
      ),
    );
  }
}
