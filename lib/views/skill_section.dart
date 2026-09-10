import 'dart:ui';

import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  final bool isDarkMode;
  const SkillsSection({super.key, required this.isDarkMode});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategoryIndex = 0;

  final List<String> categories = [
    'All Skills',
    'Mobile & Frameworks',
    'State & Architecture',
    'Backend & APIs',
    'Native & Integrations',
    'DevOps & Tools',
  ];

  final List<Map<String, dynamic>> allSkills = [
    // Mobile & Frameworks
    {
      'name': 'Flutter SDK',
      'category': 'Mobile & Frameworks',
      'level': 0.95,
      'levelLabel': 'Expert',
      'icon': Icons.flutter_dash,
      'color': Colors.lightBlue,
      'description': 'Cross-platform iOS & Android engineering, custom UI & responsive layouts.',
      'tags': ['iOS', 'Android', 'Web', 'Dart 3'],
    },
    {
      'name': 'Dart Language',
      'category': 'Mobile & Frameworks',
      'level': 0.92,
      'levelLabel': 'Expert',
      'icon': Icons.code,
      'color': Colors.blue,
      'description': 'Asynchronous programming, Streams, Isolates, Null Safety, OOP mastery.',
      'tags': ['Async/Await', 'Streams', 'Generics', 'Null Safety'],
    },

    // State & Architecture
    {
      'name': 'Clean Architecture & MVC',
      'category': 'State & Architecture',
      'level': 0.88,
      'levelLabel': 'Advanced',
      'icon': Icons.architecture,
      'color': Colors.deepPurple,
      'description': 'Decoupled domain, data, and presentation layers for maintainable codebases.',
      'tags': ['SOLID', 'Dependency Injection', 'Repository Pattern', 'GetIt'],
    },
    {
      'name': 'GetX',
      'category': 'State & Architecture',
      'level': 0.85,
      'levelLabel': 'Advanced',
      'icon': Icons.alt_route,
      'color': Colors.indigoAccent,
      'description': 'Lightweight state management, route management, and dependency injection.',
      'tags': ['GetX', 'Dependency Injection'],
    },

    // Backend & APIs
    {
      'name': 'Firebase Suite',
      'category': 'Backend & APIs',
      'level': 0.88,
      'levelLabel': 'Advanced',
      'icon': Icons.local_fire_department,
      'color': Colors.amber.shade700,
      'description': 'Firestore, Auth, Cloud Messaging (FCM), Crashlytics, and Remote Config.',
      'tags': ['FCM', 'Firestore', 'Auth', 'Analytics'],
    },
    {
      'name': 'REST APIs',
      'category': 'Backend & APIs',
      'level': 0.90,
      'levelLabel': 'Expert',
      'icon': Icons.api_rounded,
      'color': Colors.teal,
      'description': 'HTTP / Dio client, JSON serialization, Interceptors, error handling.',
      'tags': ['Dio', 'JSON Parsing', 'WebSockets'],
    },
    {
      'name': 'Local Storage & Databases',
      'category': 'Backend & APIs',
      'level': 0.82,
      'levelLabel': 'Advanced',
      'icon': Icons.storage_rounded,
      'color': Colors.cyan,
      'description': 'Offline-first data caching with Hive, Shared Preferences, and SQLite.',
      'tags': ['SharedPreferences', 'SQLite', 'Get Storage'],
    },

    // Native & Integrations
    {
      'name': 'In-App Subscriptions & Payments',
      'category': 'Native & Integrations',
      'level': 0.85,
      'levelLabel': 'Advanced',
      'icon': Icons.payments_rounded,
      'color': Colors.green,
      'description': 'App Store & Play Store subscription engines, gifting systems, and receipt validation.',
      'tags': ['In-App Purchase', 'Subscriptions'],
    },
    {
      'name': 'QR Scanning & Loyalty Rewards',
      'category': 'Native & Integrations',
      'level': 0.88,
      'levelLabel': 'Advanced',
      'icon': Icons.qr_code_scanner_rounded,
      'color': Colors.deepOrange,
      'description': 'Bulk product scanning, warranty verification, and loyalty point calculators.',
      'tags': ['QR Code', 'Camera Engine',],
    },
    {
      'name': 'Maps & Geo-Data Services',
      'category': 'Native & Integrations',
      'level': 0.82,
      'levelLabel': 'Advanced',
      'icon': Icons.map_rounded,
      'color': Colors.blueAccent,
      'description': 'Location services, property geo-data valuation, and public facility search.',
      'tags': ['Google Maps', 'Geolocation', 'Geo-Data Matrix'],
    },

    // DevOps & Tools
    {
      'name': 'App Store & Play Store Deployment',
      'category': 'DevOps & Tools',
      'level': 0.90,
      'levelLabel': 'Expert',
      'icon': Icons.storefront_rounded,
      'color': Colors.lightGreen,
      'description': 'Full lifecycle release management on Google Play Store & Apple App Store.',
      'tags': ['App Store Connect', 'Play Console', 'Release Lifecycle'],
    },
    {
      'name': 'Git & Version Control',
      'category': 'DevOps & Tools',
      'level': 0.88,
      'levelLabel': 'Advanced',
      'icon': Icons.merge_type_rounded,
      'color': Colors.redAccent,
      'description': 'Branching strategies (GitFlow), pull requests, code reviews, and versioning.',
      'tags': ['Git', 'GitHub', 'Code Reviews', 'GitFlow'],
    },
    {
      'name': 'Push Notifications & i18n',
      'category': 'DevOps & Tools',
      'level': 0.85,
      'levelLabel': 'Advanced',
      'icon': Icons.notifications_active_rounded,
      'color': Colors.pinkAccent,
      'description': 'Real-time notification feeds, disaster alerts, and multi-language internationalization.',
      'tags': ['Push Alerts', 'i18n Localization', 'Bilingual UI'],
    },
  ];

  late List<bool> isHoverList;

  @override
  void initState() {
    super.initState();
    isHoverList = List.filled(allSkills.length, false);
  }

  List<Map<String, dynamic>> get filteredSkills {
    if (_selectedCategoryIndex == 0) {
      return allSkills;
    }
    final selectedCategory = categories[_selectedCategoryIndex];
    return allSkills
        .where((skill) => skill['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final isTablet = MediaQuery.of(context).size.width < 1050;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: isMobile ? 40 : 60,
      ),
      width : double.infinity,
      color: Colors.grey.withValues(alpha: widget.isDarkMode ? 0.1 : 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Expertise',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Specialized in Flutter cross-platform architecture, production state management, and enterprise API integrations.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.65),
                ),
          ),
          const SizedBox(height: 30),

          // Category Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                final isSelected = _selectedCategoryIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? Colors.white
                            : widget.isDarkMode
                                ? Colors.grey[300]
                                : Colors.grey[800],
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.grey.withValues(alpha: 0.2),
                    side: BorderSide(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.withValues(alpha: 0.3),
                    ),
                    onSelected: (bool selected) {
                      if (selected) {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 35),

          // Skills Grid using Wrap for dynamic fitting
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1150
                  ? 3
                  : constraints.maxWidth > 700
                      ? 2
                      : 1;
              const spacing = 20.0;
              final totalSpacing = spacing * (crossAxisCount - 1);
              final itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;

              final currentSkills = filteredSkills;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(currentSkills.length, (index) {
                  return SizedBox(
                    width: itemWidth,
                    child: _buildSkillCard(currentSkills[index], index),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill, int index) {
    return MouseRegion(
      onEnter: (_) {
        if (index < isHoverList.length) {
          setState(() => isHoverList[index] = true);
        }
      },
      onExit: (_) {
        if (index < isHoverList.length) {
          setState(() => isHoverList[index] = false);
        }
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: skill['level']),
        duration: const Duration(milliseconds: 900),
        builder: (context, double value, child) {
          final isHovered = index < isHoverList.length && isHoverList[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: isHovered ? 0.35 : 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isHovered
                        ? (skill['color'] as Color).withValues(alpha: 0.5)
                        : Colors.transparent,
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Skill Header with Icon, Name & Level Badge
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (skill['color'] as Color).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            skill['icon'] as IconData,
                            color: skill['color'] as Color,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            skill['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: (skill['color'] as Color).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            skill['levelLabel'],
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: widget.isDarkMode
                                  ? Colors.white
                                  : Colors.grey.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      skill['description'],
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.35,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.75),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Skill Progress Bar
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: value,
                              backgroundColor: Colors.grey.withValues(alpha: 0.3),
                              color: skill['color'] as Color,
                              minHeight: 6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${(value * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: widget.isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Tech Tags (Wrap)
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: (skill['tags'] as List<String>).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 10.5,
                              color: widget.isDarkMode
                                  ? Colors.grey[300]
                                  : Colors.grey[800],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
