import 'package:flutter/material.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final List<Map<String, dynamic>> experiences = [
    {
      'title': 'Senior Flutter Developer',
      'company': 'Tech Company Inc.',
      'period': '2021 - Present',
      'description':
          'Leading the Flutter development team and architecting mobile applications for clients worldwide.',
    },
    {
      'title': 'Flutter Developer',
      'company': 'Startup Solutions',
      'period': '2019 - 2021',
      'description':
          'Developed and maintained cross-platform mobile applications using Flutter framework.',
    },
    {
      'title': 'Junior Mobile Developer',
      'company': 'Digital Agency',
      'period': '2018 - 2019',
      'description':
          'Worked on various mobile projects and learned the fundamentals of mobile development.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: 80,
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
            separatorBuilder: (context, index) => const SizedBox(height: 30),
            itemBuilder: (context, index) {
              return _buildExperienceItem(experiences[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Map<String, dynamic> experience, int index) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: 500 + (index * 200)),
      child: AnimatedPadding(
        duration: Duration(milliseconds: 500 + (index * 200)),
        padding: const EdgeInsets.all(20),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha:0.05),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
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
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  experience['period'],
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 245, 192, 255),
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
    );
  }
}