import 'package:flutter/material.dart';

import 'a1_info_column.dart';
import 'a2_counter.dart';
import 'a3_scaffold_fab.dart';
import 'a4_fruit_list.dart';
import 'a5_color_grid.dart';
import 'a6_image_card.dart';
import 'a7_drawer_navigation.dart';
import 'a8_bottom_nav.dart';
import 'a9_stack_label.dart';
import 'a10_section_title.dart';

import 'b1_lifecycle_demo.dart';
import 'b2_responsive_layout.dart';
import 'b3_product_grid.dart';
import 'b4_profile_card.dart';
import 'b5_chip_selector.dart';
import 'b6_badge_icon.dart';
import 'b7_tab_bar.dart';
import 'b8_settings_table.dart';
import 'b9_responsive_form.dart';
import 'b10_media_aspect_ratio.dart';

import 'c1_responsive_dashboard.dart';
import 'c2_custom_widget_library.dart';
import 'c3_product_detail.dart';
import 'c4_todo_app.dart';
import 'c5_responsive_nav_shell.dart';
import 'c6_multitab_profile.dart';
import 'c7_news_feed.dart';
import 'c8_profile_header.dart';
import 'c9_responsive_settings.dart';
import 'c10_lifecycle_logger.dart';

void main() {
  runApp(const MadPracticalsApp());
}

class MadPracticalsApp extends StatelessWidget {
  const MadPracticalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD Practicals Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const PracticalLauncherScreen(),
    );
  }
}

class PracticalLauncherScreen extends StatelessWidget {
  const PracticalLauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAD Practicals (30 Programs)'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          _buildSectionHeader(context, 'Section A — Easy Level (10)', Colors.green),
          _buildPracticalTile(
            context,
            'A1: Name, College & Course Column',
            'a1_info_column.dart',
            const InfoColumnScreen(),
          ),
          _buildPracticalTile(
            context,
            'A2: Counter App with Increment/Decrement',
            'a2_counter.dart',
            const CounterScreen(),
          ),
          _buildPracticalTile(
            context,
            'A3: Scaffold with AppBar & FAB',
            'a3_scaffold_fab.dart',
            const ScaffoldFabScreen(),
          ),
          _buildPracticalTile(
            context,
            'A4: ListView.builder Fruit Names',
            'a4_fruit_list.dart',
            const FruitListScreen(),
          ),
          _buildPracticalTile(
            context,
            'A5: GridView.count 6 Coloured Boxes',
            'a5_color_grid.dart',
            const ColorGridScreen(),
          ),
          _buildPracticalTile(
            context,
            'A6: Card Widget with Image & Description',
            'a6_image_card.dart',
            const ImageCardScreen(),
          ),
          _buildPracticalTile(
            context,
            'A7: Drawer with 4 Menu ListTiles',
            'a7_drawer_navigation.dart',
            const DrawerNavScreen(),
          ),
          _buildPracticalTile(
            context,
            'A8: BottomNavigationBar 3 Tabs',
            'a8_bottom_nav.dart',
            const BottomNavScreen(),
          ),
          _buildPracticalTile(
            context,
            'A9: Stack Text Label on Container',
            'a9_stack_label.dart',
            const StackLabelScreen(),
          ),
          _buildPracticalTile(
            context,
            'A10: Reusable SectionTitle Custom Widget',
            'a10_section_title.dart',
            const SectionTitleDemoScreen(),
          ),

          const SizedBox(height: 16),
          _buildSectionHeader(context, 'Section B — Moderate Level (10)', Colors.orange.shade800),
          _buildPracticalTile(
            context,
            'B1: StatefulWidget Lifecycle Demo Logs',
            'b1_lifecycle_demo.dart',
            const LifecycleDemoScreen(),
          ),
          _buildPracticalTile(
            context,
            'B2: Responsive Column/Row LayoutBuilder',
            'b2_responsive_layout.dart',
            const ResponsiveLayoutScreen(),
          ),
          _buildPracticalTile(
            context,
            'B3: Product Listing GridView.builder',
            'b3_product_grid.dart',
            const ProductGridScreen(),
          ),
          _buildPracticalTile(
            context,
            'B4: Reusable ProfileCard Widget',
            'b4_profile_card.dart',
            const ProfileCardDemoScreen(),
          ),
          _buildPracticalTile(
            context,
            'B5: Tag/Skill Selector using Wrap & Chips',
            'b5_chip_selector.dart',
            const ChipSelectorScreen(),
          ),
          _buildPracticalTile(
            context,
            'B6: Stack & Positioned Badge Icon',
            'b6_badge_icon.dart',
            const BadgeIconScreen(),
          ),
          _buildPracticalTile(
            context,
            'B7: TabBar with 3 Tabs & Views',
            'b7_tab_bar.dart',
            const TabBarScreen(),
          ),
          _buildPracticalTile(
            context,
            'B8: Settings Screen with Table Widget',
            'b8_settings_table.dart',
            const SettingsTableScreen(),
          ),
          _buildPracticalTile(
            context,
            'B9: MediaQuery Adaptive Form Layout',
            'b9_responsive_form.dart',
            const ResponsiveFormScreen(),
          ),
          _buildPracticalTile(
            context,
            'B10: 16:9 AspectRatio Media Cards',
            'b10_media_aspect_ratio.dart',
            const MediaAspectRatioScreen(),
          ),

          const SizedBox(height: 16),
          _buildSectionHeader(context, 'Section C — Hard Level (10)', Colors.purple.shade700),
          _buildPracticalTile(
            context,
            'C1: Complete Responsive Dashboard',
            'c1_responsive_dashboard.dart',
            const ResponsiveDashboardScreen(),
          ),
          _buildPracticalTile(
            context,
            'C2: Custom Widget Library & Demo Screen',
            'c2_custom_widget_library.dart',
            const CustomWidgetLibraryScreen(),
          ),
          _buildPracticalTile(
            context,
            'C3: E-Commerce Product Detail Screen',
            'c3_product_detail.dart',
            const ProductDetailScreen(),
          ),
          _buildPracticalTile(
            context,
            'C4: Todo App with didUpdateWidget',
            'c4_todo_app.dart',
            const TodoAppScreen(),
          ),
          _buildPracticalTile(
            context,
            'C5: Responsive Navigation Shell',
            'c5_responsive_nav_shell.dart',
            const ResponsiveNavShellScreen(),
          ),
          _buildPracticalTile(
            context,
            'C6: Multi-Tab Profile Screen',
            'c6_multitab_profile.dart',
            const MultiTabProfileScreen(),
          ),
          _buildPracticalTile(
            context,
            'C7: News Feed Card with IntrinsicHeight',
            'c7_news_feed.dart',
            const NewsFeedScreen(),
          ),
          _buildPracticalTile(
            context,
            'C8: Overlapping Avatar Profile Header',
            'c8_profile_header.dart',
            const ProfileHeaderScreen(),
          ),
          _buildPracticalTile(
            context,
            'C9: Responsive Reflowing Settings Screen',
            'c9_responsive_settings.dart',
            const ResponsiveSettingsScreen(),
          ),
          _buildPracticalTile(
            context,
            'C10: Widget Lifecycle Logger Utility',
            'c10_lifecycle_logger.dart',
            const LifecycleLoggerScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget _buildPracticalTile(
    BuildContext context,
    String title,
    String fileName,
    Widget targetScreen,
  ) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('File: lib/$fileName', style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
      ),
    );
  }
}
