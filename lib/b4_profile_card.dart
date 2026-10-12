import 'package:flutter/material.dart';

/// Practical B4: Build a custom `ProfileCard` widget accepting name, role,
/// image URL and an onTap callback as constructor parameters, and use it
/// three times with different data.

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(imageUrl),
          child: const Icon(Icons.person),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          role,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}

class ProfileCardDemoScreen extends StatelessWidget {
  const ProfileCardDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B4: ProfileCard Widget Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          ProfileCard(
            name: 'Alice Johnson',
            role: 'Mobile Developer',
            imageUrl: 'https://i.pravatar.cc/150?img=1',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tapped Alice Johnson')),
              );
            },
          ),
          ProfileCard(
            name: 'Bob Smith',
            role: 'UI/UX Designer',
            imageUrl: 'https://i.pravatar.cc/150?img=2',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tapped Bob Smith')),
              );
            },
          ),
          ProfileCard(
            name: 'Carol White',
            role: 'Project Manager',
            imageUrl: 'https://i.pravatar.cc/150?img=3',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tapped Carol White')),
              );
            },
          ),
        ],
      ),
    );
  }
}
