import 'package:flutter/material.dart';

/// Practical C8: Create a custom layout using Stack and Positioned to build
/// a profile header where a circular avatar overlaps the bottom edge of a banner
/// image, similar to popular social media app headers.
class ProfileHeaderScreen extends StatelessWidget {
  const ProfileHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C8: Overlapping Profile Header'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack header for overlapping avatar over banner
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  // Banner Image (height 150)
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.deepPurple.shade300,
                    child: Image.network(
                      'https://picsum.photos/800/300?banner',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.deepPurple.shade200,
                        child: const Center(
                          child: Icon(Icons.landscape, size: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // Overlapping Circular Avatar
                  Positioned(
                    top: 105, // Overlaps bottom edge of banner (150 - 45)
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 8),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                        child: Icon(Icons.person, size: 50),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Edit Profile'),
                    ),
                  ),
                ],
              ),
            ),
            // Profile details below header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Dipti Patel',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '@dipti_patel',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Passionate Flutter & Native Android Developer. Building seamless mobile experiences for modern applications.',
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.deepPurple),
                    title: Text('Gujarat, India'),
                  ),
                  ListTile(
                    leading: Icon(Icons.link, color: Colors.deepPurple),
                    title: Text('https://github.com/diptipatel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
