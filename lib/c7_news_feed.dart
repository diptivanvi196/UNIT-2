import 'package:flutter/material.dart';

/// Practical C7: Build a card-based news feed screen where each Card uses
/// IntrinsicHeight to align an image and text side by side with matching heights,
/// and the whole feed loads through ListView.builder.
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  final List<Map<String, String>> news = const [
    {
      'title': 'Flutter 3.16 Released with Major Performance Boosts',
      'summary': 'The latest Flutter update introduces Impeller renderer optimizations, new Material 3 features, and enhanced desktop support across operating systems.',
      'time': '2 hrs ago',
    },
    {
      'title': 'AI Revolution in Mobile Application Development',
      'summary': 'Artificial Intelligence algorithms and on-device models are empowering developers to create smarter, highly personalized user experiences.',
      'time': '4 hrs ago',
    },
    {
      'title': 'Clean Architecture Patterns for Modern Android Apps',
      'summary': 'Exploring SOLID design principles, modularity, testability, and state management techniques in enterprise cross-platform mobile apps.',
      'time': '6 hrs ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C7: News Feed (IntrinsicHeight)'),
        backgroundColor: Colors.blueGrey.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final item = news[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            clipBehavior: Clip.antiAlias,
            // IntrinsicHeight aligns image & text height equal side-by-side!
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 120,
                    child: Image.network(
                      'https://picsum.photos/300/300?news=$index',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.blueGrey.shade100,
                        child: const Center(
                          child: Icon(Icons.newspaper, size: 40, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['summary']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['time']!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
