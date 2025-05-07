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
      'title': 'E-commerce App',
      'description': 'A complete e-commerce solution with payment integration and product management.',
      'technologies': ['Flutter', 'Firebase'],
      'image': 'https://media.istockphoto.com/id/1418233376/vector/user-interface-design-for-business-dashboard-app.jpg?s=1024x1024&w=is&k=20&c=vI5mOPdIKdDuF3fozkNPoOxGymVJE03D3naRE-FIAfs=',
      "url" : "",
    },
    {
      'title': 'Free Movie App',
      'description': 'A movie app that provides information about movies and TV shows.',
      'technologies': ['Flutter', 'Getx', 'Movie API'],
      'image': 'https://media.istockphoto.com/id/1211397971/vector/modern-infographic-vector-elements-for-business-brochures-use-in-website-corporate-brochure.jpg?s=1024x1024&w=is&k=20&c=n96F8jCXv0Ow_7vyIpdoYBvY7QVUFDwFgFMEkVKt-Jw=',
      "url" : "",
    },
    {
      'title': 'Guitar Tuner App',
      'description': 'A simple app for tuning guitars and to listen different Nepali songs',
      'technologies': ['Flutter', 'Bloc', 'Firebase'],
      'image': 'https://media.istockphoto.com/id/994915122/vector/fitness-app-ui-ux-design-web-design-and-mobile-template-infographic-on-benefits-of-healthy.jpg?s=1024x1024&w=is&k=20&c=2xMWVPUlkMeYkDfVUAWd0UfKILy8xHOSPApSugweLfU=',
      "url" : "",
    },
    {
      'title': 'Fantasy Premier League App',
      'description': 'A fantasy sports app for managing teams and tracking player stats.',
      'technologies': ['Flutter', 'Premier League API', 'Getx'],
      'image': 'https://media.istockphoto.com/id/1176582493/vector/vector-graphics-set-mobile-infographics-stock-vector.jpg?s=1024x1024&w=is&k=20&c=6Kaavv7M0DUEdxMAvKdBS79z5YhQY-OWQo71wi4lwyI=',
      "url" : "",
    },
  ];

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
            'Here are some of my recent works',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha:0.6),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              // Dynamic grid configuration based on available width
              final crossAxisCount = constraints.maxWidth > 1100
                  ? 3
                  : constraints.maxWidth > 800
                      ? 2
                      : 1;
              double childAspectRatio = constraints.maxWidth > 800 ? 0.95 : constraints.maxWidth > 400 ?  1.15 : 0.85;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(projects[index], index, context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
      Map<String, dynamic> project, int index, BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: () {
              AppUtils().openLinkWithUrl(project['url']);
            },
            child: Card(
              color: Colors.grey.withValues(alpha:0.2),
              shadowColor: Colors.transparent,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project image with overlay
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.network(
                          project['image'],
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 220,
                              color: Colors.grey.withValues(alpha:0.1),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 220,
                              color: Colors.grey.withValues(alpha:0.1),
                              child: const Icon(Icons.broken_image),
                            );
                          },
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha:0.7),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Text(
                          project['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Project details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha:0.8),
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                              // Technology chips
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: project['technologies']
                                    .map<Widget>((tech) => Chip(
                                          label: Text(
                                            tech,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          backgroundColor:
                                              Theme.of(context).colorScheme.primary.withValues(alpha:0.1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          side: BorderSide.none,
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                          // View project button
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {
                                // Handle project view
                              },
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('View Project'),
                            ),
                          ),
                        ],
                      ),
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
}