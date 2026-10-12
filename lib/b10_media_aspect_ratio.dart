import 'package:flutter/material.dart';

/// Practical B10: Design a media card using AspectRatio to maintain a 16:9
/// image/video placeholder inside a scrollable ListView.
class MediaAspectRatioScreen extends StatelessWidget {
  const MediaAspectRatioScreen({super.key});

  final List<String> titles = const [
    'Nature Exploration Vlog #1',
    'Flutter 3.16 Layout Tutorial',
    'Mountain Biking Adventure',
    'Tech Conference Highlights 2024',
    'Cooking Masterclass: Italian Pasta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B10: 16:9 AspectRatio Media List'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 16:9 AspectRatio Container
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.black87,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          'https://picsum.photos/600/338?random=$index',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.red.shade100,
                            child: const Center(
                              child: Icon(Icons.movie, size: 60, color: Colors.red),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Aspect Ratio 16:9 media placeholder maintaining video proportions.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
