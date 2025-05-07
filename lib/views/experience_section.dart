import 'dart:ui';
import 'package:flutter/material.dart';

class ExperienceSection extends StatefulWidget {
  final bool isDarkMode;
  const ExperienceSection({super.key, required this.isDarkMode});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final List<Map<String, dynamic>> experiences = [
    {
      'title': 'Flutter Developer',
      'company': 'Miracle Interface',
      'period': '2022 - 2025',
      'description':
          'Developed and maintained cross-platform mobile applications using Flutter framework.',
    },
    {
      'title': 'Junior Mobile Developer',
      'company': 'Digital Agency',
      'period': '2020 - 2022',
      'description':
          'Worked on various mobile projects and learned the fundamentals of mobile development.',
    },
  ];

  late List<bool> isHoverList;

  @override
  void initState() {
    super.initState();
    isHoverList = List.filled(experiences.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
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
            'My Experience',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return _buildExperienceItem(experiences[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Map<String, dynamic> experience, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHoverList[index] = true),
      onExit: (_) => setState(() => isHoverList[index] = false),
      child: AnimatedOpacity(
        opacity: isHoverList[index] ? 0.95 : 1.0,
        duration: Duration(milliseconds: 300),
        child: AnimatedPadding(
          duration: Duration(milliseconds: 500 + (index * 200)),
          padding: const EdgeInsets.all(20),
          curve: Curves.easeInOut,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha:isHoverList[index] ? 0.4 : 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience['title'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        experience['company'],
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        experience['period'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        experience['description'],
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
