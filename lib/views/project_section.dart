import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/constant/utils.dart';

class ProjectsSection extends StatefulWidget {
  final bool isDarkMode;
  const ProjectsSection({super.key, required this.isDarkMode});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> projects = [
    {
      'id': 'goatus',
      'title': 'GOATUS App',
      'category': 'Mobile App (Japan)',
      'isShowcase': true,
      'appIcon': 'assets/icons/goatus.png',
      'stack': ['Flutter', 'Dart', 'Firebase', 'In-App Subscriptions', 'BLoC'],
      'shortDesc':
          'Japanese app engineered for Athletes where fans can subscribe, gift, view activities, and engage directly.',
      'longDesc':
          'GOATUS is a specialized Japanese mobile platform built for athletes and fans. Fans can subscribe to their favorite athletes, send gifts, track real-time athletic activities, and access exclusive content. Built with Flutter, clean BLoC architecture, and Firebase for scalable real-time synchronization.',
      'status': 'STORE RELEASE',
      'playstore':
          'https://play.google.com/store/apps/details?id=jp.goatus&hl=en',
      'appstore':
          'https://apps.apple.com/jp/app/goatus-%E3%82%B4%E3%83%BC%E3%82%BF%E3%82%B9/id6499320524?l=en-US',
      'metrics': [
        'Available on Japan Play Store & App Store',
        'In-app subscription & gifting payment engine',
        'Real-time activity feed & notifications',
        'High-performance cross-platform Flutter architecture'
      ]
    },
    {
      'id': 'pecon',
      'title': 'Pecon App',
      'category': 'Wholesale E-Commerce',
      'isShowcase': true,
      'appIcon': 'assets/icons/pecon.png',
      'stack': [
        'Flutter',
        'QR Scanning',
        'Reward Engine',
        'REST API',
        'Electronics'
      ],
      'shortDesc':
          'E-commerce app for wholesale buyers of electronic products featuring QR code scanning & rewards system.',
      'longDesc':
          'Pecon App is a B2B wholesale e-commerce mobile application designed for electronic product procurement. Features integrated QR code scanning for bulk inventory orders, automated catalog sync, and buyer reward point tracking.',
      'status': 'STORE RELEASE',
      'playstore': 'https://play.google.com/store/search?q=Pecon&c=apps&hl=en',
      'metrics': [
        'Available on Google Play Store',
        'Wholesale buyer QR scanner procurement flow',
        'Automated reward points & loyalty program',
        'Electronic goods catalog & bulk order processing'
      ]
    },
    {
      'id': 'trandz-vistaar',
      'title': 'Trandz Vistaar',
      'category': 'Appliances E-Commerce',
      'isShowcase': true,
      'appIcon': 'assets/icons/trandz-vistaar.png',
      'stack': [
        'Flutter',
        'QR Code Scanner',
        'Loyalty Rewards',
        'E-Commerce',
        'Dart'
      ],
      'shortDesc':
          'E-commerce platform for purchasing house appliances with QR scanning and customer reward programs.',
      'longDesc':
          'Trandz Vistaar is a consumer e-commerce mobile application for purchasing home appliances. Built with Flutter, it integrates instant QR scanning for product authenticity verification, digital warranty registration, and customer reward points redemption.',
      'status': 'STORE RELEASE',
      'playstore':
          'https://play.google.com/store/search?q=trandz%20vistaar&c=apps&hl=en',
      'metrics': [
        'Available on Google Play Store',
        'Home appliance catalog & warranty scan engine',
        'Customer reward system & points redemption',
        'Seamless Flutter mobile checkout experience'
      ]
    },
    {
      'id': 'mulyankan',
      'title': 'MULYANKAN App',
      'category': 'Land Valuation Nepal',
      'isShowcase': true,
      'appIcon': 'assets/icons/mulyankan.png',
      'stack': [
        'Flutter',
        'Land Valuation Algorithm',
        'Nepal Geo-Data',
        'iOS & Android'
      ],
      'shortDesc':
          'Specialized mobile application for official land valuation and property real estate assessment in Nepal.',
      'longDesc':
          'MULYANKAN is a land valuation mobile app engineered for real estate assessment across Nepal. It allows users, evaluators, and financial institutions to compute precise land values based on government rates, road access, location coordinates, and land area parameters.',
      'status': 'STORE RELEASE',
      'playstore':
          'https://play.google.com/store/apps/details?id=com.app.mulyankan&hl=en',
      'appstore': 'https://apps.apple.com/us/app/mulyankan/id6446269812',
      'metrics': [
        'Available on Play Store & Apple App Store',
        'Official land valuation calculation algorithms',
        'Property geo-data & government rate matrix',
        'Used by real estate evaluators in Nepal'
      ]
    },
    {
      'id': 'durgabhagawati',
      'title': 'Durga Bhagawati Gaupalika',
      'category': 'Civic Utility Mobile',
      'isShowcase': true,
      'appIcon': 'assets/icons/durgabhagawati.png',
      'stack': ['Flutter', 'Android SDK', 'Firebase', 'Civic Tech', 'Nepal Ward'],
      'shortDesc':
          'Ward app in Nepal delivering real-time municipal notices, assistance, and situation updates to citizens.',
      'longDesc':
          'Created for the Durga Bhagawati Rural Municipality ward in Nepal, this mobile application provides local residents with instant news updates, official ward notices, situational assistance, and direct municipal service channels.',
      'status': 'STORE RELEASE',
      'playstore':
          'https://play.google.com/store/apps/details?id=com.durgagaupalika.np',
      'github': 'https://github.com/Anikshakya/Durga-Bhagawati-Gaupalika',
      'metrics': [
        'Available on Google Play Store in Nepal',
        'Real-time municipal notices & news feed',
        'Civic assistance request submission port',
        'Bilingual support UI for local citizens'
      ]
    },
    {
      'id': 'morinfo',
      'title': 'Morinfo App',
      'category': 'Civic Utility Mobile',
      'isShowcase': true,
      'appIcon': 'assets/icons/morinfo.png',
      'stack': [
        'Flutter',
        'Dart',
        'Firebase',
        'Push Notifications',
        'Maps',
        'Multilingual Support',
        'NFC / My Number Card',
      ],
      'shortDesc':
          'Official Moriya City mobile application providing residents with disaster alerts, city notifications, electronic applications, garbage collection information, and daily-life services.',
      'longDesc':
          'Morinfo is the official Moriya City mobile application in Japan. The app brings essential municipal services and daily-life information together in one platform, including disaster and evacuation alerts, city announcements, event information, garbage collection schedules, public facility search, electronic applications, multilingual support, and My Number Card integration using NFC.',
      'status': 'STORE RELEASE',
      'playstore':
          'https://play.google.com/store/apps/details?id=jp.portal.moriya&hl=en',
      'appstore': 'https://apps.apple.com/jp/app/morinfo/id6752234095?l=en-US',
      'metrics': [
        'Available on Japan Google Play Store & Apple App Store',
        'Official Moriya City civic service application',
        'Disaster alerts & evacuation information',
        'Electronic applications and municipal notifications',
        'Garbage collection calendar & reminder notifications',
        'Public facility search with map integration',
        'Multilingual support & My Number Card NFC integration',
      ],
    },
    {
      'id': 'sendai-portal',
      'title': 'SENDAIポータル',
      'category': 'Civic Utility Mobile',
      'isShowcase': true,
      'appIcon': 'assets/icons/sendai-portal.png',
      'stack': [
        'Flutter',
        'Dart',
        'Firebase',
        'Push Notifications',
        'Weather API',
        'Disaster Information',
        'Maps',
      ],
      'shortDesc':
          'Official Sendai City portal application providing local announcements, weather, disaster information, garbage schedules, events, and online municipal services.',
      'longDesc':
          'SENDAIポータル is the official regional portal application for Sendai City, Miyagi Prefecture, Japan. The application provides residents with city announcements, event information, weather and temperature updates, earthquake and tsunami information, heatstroke and heavy-rain alerts, garbage collection information, personal calendars, digital mailbox services, and online municipal procedures.',
      'status': 'STORE RELEASE',
      'playstore':
          'https://play.google.com/store/apps/details?id=com.sendai_portal&hl=en',
      'appstore':
          'https://apps.apple.com/jp/app/sendai%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%AB/id6478195671',
      'metrics': [
        'Available on Japan Google Play Store & Apple App Store',
        'Official Sendai City regional portal application',
        'City announcements & event notifications',
        'Weather, earthquake & tsunami information',
        'Disaster and heatstroke warning notifications',
        'Garbage collection calendar & local information',
        'Digital mailbox with My Number Card integration',
        'Online municipal procedures',
      ],
    },
  ];

  String? _getPrimaryUrl(Map<String, dynamic> project) {
    if (project['playstore'] != null) return project['playstore'];
    if (project['appstore'] != null) return project['appstore'];
    if (project['github'] != null) return project['github'];
    return project['url'];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: isMobile ? 40 : 60,
      ),
      color: Colors.grey.withValues(alpha: widget.isDarkMode ? 0.1 : 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Production mobile apps & platforms released on App Store and Play Store',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1150
                  ? 3
                  : constraints.maxWidth > 700
                      ? 2
                      : 1;

              const spacing = 24.0;
              final totalSpacing = spacing * (crossAxisCount - 1);
              final cardWidth =
                  (constraints.maxWidth - totalSpacing) / crossAxisCount;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: projects.asMap().entries.map((entry) {
                  return SizedBox(
                    width: cardWidth,
                    child: _buildProjectCard(entry.value, entry.key, context),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    Map<String, dynamic> project,
    int index,
    BuildContext context,
  ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryUrl = _getPrimaryUrl(project);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: () {
              if (primaryUrl != null) {
                AppUtils().openLinkWithUrl(primaryUrl);
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Card(
              color: Colors.grey.withValues(alpha: 0.2),
              shadowColor: Colors.transparent,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Header Banner
                  _buildCardHeader(project, context),

                  // Project details - Dynamic natural height container
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['shortDesc'] ?? project['description'] ?? '',
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.85),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Tech Stack Chips
                        _buildStackChips(
                          project['stack'] ?? project['technologies'] ?? [],
                          isDarkMode,
                        ),
                        const SizedBox(height: 12),
                        // Metrics Highlights
                        if (project['metrics'] != null)
                          _buildMetricsList(project['metrics'] as List<dynamic>),
                        const SizedBox(height: 16),
                        // Store Buttons
                        _buildStoreButtons(project),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader(Map<String, dynamic> project, BuildContext context) {
    final String? iconPath = project['appIcon'];
    final String title = project['title'] ?? 'Project';
    final String category = project['category'] ?? '';
    final String status = project['status'] ?? 'STORE RELEASE';

    final List<Color> gradientColors = widget.isDarkMode
        ? [
            Colors.purple.shade900,
            Colors.indigo.shade900,
          ]
        : [
            Colors.deepPurple.shade700,
            Colors.indigo.shade700,
          ];

    return Container(
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Category tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green.shade800.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.greenAccent.shade200, width: 0.8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.verified, color: Colors.greenAccent, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      status,
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              // App Icon / Initial Avatar
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _buildAppIconWidget(iconPath, title),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppIconWidget(String? iconPath, String title) {
    if (iconPath != null && iconPath.isNotEmpty) {
      if (iconPath.startsWith('http://') || iconPath.startsWith('https://')) {
        return Image.network(
          iconPath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallbackIcon(title),
        );
      } else {
        final cleanPath = iconPath.startsWith('/') ? iconPath.substring(1) : iconPath;
        return Image.asset(
          cleanPath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallbackIcon(title),
        );
      }
    }
    return _buildFallbackIcon(title);
  }

  Widget _buildFallbackIcon(String title) {
    return Center(
      child: Text(
        title.isNotEmpty ? title[0].toUpperCase() : 'A',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildStackChips(List<dynamic> stack, bool isDarkMode) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: stack.map<Widget>((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            tech.toString(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.purpleAccent.shade100 : Colors.purple.shade700,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMetricsList(List<dynamic> metrics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: metrics.map<Widget>((metric) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 13,
                color: Colors.purpleAccent,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  metric.toString(),
                  style: TextStyle(
                    fontSize: 11.5,
                    height: 1.3,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.75),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStoreButtons(Map<String, dynamic> project) {
    final playstore = project['playstore'];
    final appstore = project['appstore'];
    final github = project['github'];

    List<Widget> buttons = [];

    if (playstore != null) {
      buttons.add(
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => AppUtils().openLinkWithUrl(playstore),
            icon: const Icon(Icons.android, size: 14),
            label: const Text('Play Store', style: TextStyle(fontSize: 11)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              minimumSize: const Size(0, 34),
            ),
          ),
        ),
      );
    }

    if (appstore != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(width: 6));
      buttons.add(
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => AppUtils().openLinkWithUrl(appstore),
            icon: const Icon(Icons.apple, size: 14),
            label: const Text('App Store', style: TextStyle(fontSize: 11)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              minimumSize: const Size(0, 34),
            ),
          ),
        ),
      );
    }

    if (github != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(width: 6));
      buttons.add(
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => AppUtils().openLinkWithUrl(github),
            icon: const Icon(Icons.code, size: 14),
            label: const Text('GitHub', style: TextStyle(fontSize: 11)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              minimumSize: const Size(0, 34),
            ),
          ),
        ),
      );
    }

    if (buttons.isEmpty) {
      final primaryUrl = _getPrimaryUrl(project);
      if (primaryUrl != null) {
        buttons.add(
          Expanded(
            child: FilledButton(
              onPressed: () => AppUtils().openLinkWithUrl(primaryUrl),
              child: const Text('View App', style: TextStyle(fontSize: 12)),
            ),
          ),
        );
      }
    }

    return Row(children: buttons);
  }
}