import 'dart:ui';
import 'package:flutter/material.dart';

class ExperienceSection extends StatefulWidget {
  final bool isDarkMode;

  const ExperienceSection({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final List<Map<String, dynamic>> experiences = [
    {
      'title': 'Flutter Developer',
      'company': 'Miracle Interface',
      'location': 'Kathmandu, Nepal',
      'startDate': DateTime(2023, 2),
      'endDate': null, // Present
      'isCurrent': true,
      'description':
          'Architecting and shipping high-performance cross-platform Flutter applications for international clients in Japan and Nepal.',
      'achievements': [
        'Developed and released 7+ production mobile apps on App Store and Google Play.',
        'Implemented BLoC state management, offline-first sync, and REST API integrations.',
        'Engineered specialized native hardware features including NFC My Number Card and QR scanner engines.',
      ],
      'technologies': ['Flutter', 'Dart', 'BLoC', 'Firebase', 'REST API', 'NFC', 'In-App Purchase'],
    },
    {
      'title': 'Flutter Trainee',
      'company': 'Miracle Interface',
      'location': 'Kathmandu, Nepal',
      'startDate': DateTime(2022, 8),
      'endDate': DateTime(2023, 2),
      'isCurrent': false,
      'description':
          'Strengthened mobile application engineering skills and contributed to commercial client mobile projects.',
      'achievements': [
        'Built responsive mobile UIs and reusable component widget libraries.',
        'Integrated Firebase authentication, push notifications, and analytics.',
      ],
      'technologies': ['Flutter', 'Dart', 'Firebase', 'GetX', 'Git'],
    },
    {
      'title': 'Flutter Intern',
      'company': 'Miracle Interface',
      'location': 'Kathmandu, Nepal',
      'startDate': DateTime(2022, 4),
      'endDate': DateTime(2022, 8),
      'isCurrent': false,
      'description':
          'Gained hands-on commercial experience in cross-platform mobile development and Dart fundamental patterns.',
      'achievements': [
        'Assisted senior developers in UI bug fixes and feature development.',
        'Mastered Flutter layouts, REST API consumption, and Git version control.',
      ],
      'technologies': ['Flutter', 'Dart', 'REST API', 'Git'],
    },
  ];

  late List<bool> isHoverList;

  @override
  void initState() {
    super.initState();
    isHoverList = List.filled(experiences.length, false);
  }

  String _formatPeriod(Map<String, dynamic> experience) {
    final startDate = experience['startDate'] as DateTime;
    final endDate = experience['endDate'] as DateTime?;

    final start = '${_monthName(startDate.month)} ${startDate.year}';

    if (endDate == null) {
      return '$start - Present';
    }

    final end = '${_monthName(endDate.month)} ${endDate.year}';
    return '$start - $end';
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final isTablet = MediaQuery.of(context).size.width < 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'My professional journey and track record in mobile app engineering',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.65),
                ),
          ),
          const SizedBox(height: 40),

          // Timeline View
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              final isLast = index == experiences.length - 1;
              return _buildTimelineItem(experiences[index], index, isLast, isMobile);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    Map<String, dynamic> experience,
    int index,
    bool isLast,
    bool isMobile,
  ) {
    final isCurrent = experience['isCurrent'] == true;

    return MouseRegion(
      onEnter: (_) => setState(() => isHoverList[index] = true),
      onExit: (_) => setState(() => isHoverList[index] = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Line & Dot Column
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? Colors.purpleAccent
                        : widget.isDarkMode
                            ? Colors.purple.shade900
                            : Colors.purple.shade200,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCurrent ? Colors.white : Colors.purpleAccent,
                      width: isCurrent ? 3 : 2,
                    ),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color: Colors.purpleAccent.withValues(alpha: 0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                  child: isCurrent
                      ? const Icon(Icons.work, size: 12, color: Colors.white)
                      : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.purpleAccent.withValues(alpha: 0.3),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),

            // Experience Card Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(
                          alpha: isHoverList[index] ? 0.35 : 0.2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isHoverList[index]
                              ? Colors.purpleAccent.withValues(alpha: 0.5)
                              : Colors.grey.withValues(alpha: 0.15),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title & Current Badge Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  experience['title'],
                                  style: TextStyle(
                                    fontSize: isMobile ? 18 : 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (isCurrent)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade800.withValues(alpha: 0.4),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.greenAccent, width: 0.8),
                                  ),
                                  child: const Text(
                                    'Present Role',
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Company & Location
                          Row(
                            children: [
                              Text(
                                experience['company'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purpleAccent,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '•  ${experience['location']}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: widget.isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Period
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded,
                                  size: 13, color: Colors.grey),
                              const SizedBox(width: 6),
                              Text(
                                _formatPeriod(experience),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: widget.isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Summary
                          Text(
                            experience['description'],
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.85),
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Achievements List
                          if (experience['achievements'] != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (experience['achievements'] as List<String>)
                                  .map((ach) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.check_circle_outline_rounded,
                                        size: 14,
                                        color: Colors.purpleAccent,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          ach,
                                          style: TextStyle(
                                            fontSize: 13,
                                            height: 1.4,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          const SizedBox(height: 14),

                          // Tech Stack Chips
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: (experience['technologies'] as List<String>)
                                .map((tech) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  tech,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: widget.isDarkMode
                                        ? Colors.purpleAccent.shade100
                                        : Colors.purple.shade700,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}