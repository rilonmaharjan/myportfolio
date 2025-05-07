import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'level': 0.9, 'color': Colors.blue},
    {'name': 'Dart', 'level': 0.85, 'color': Colors.blue[700]!},
    {'name': 'Firebase', 'level': 0.8, 'color': Colors.orange},
    {'name': 'UI/UX Design', 'level': 0.75, 'color': Colors.purple},
    {'name': 'JavaScript', 'level': 0.7, 'color': Colors.yellow[700]!},
    {'name': 'Node.js', 'level': 0.65, 'color': Colors.green},
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
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha:0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Skills',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3.0,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _buildSkillItem(skills[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(Map<String, dynamic> skill) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: skill['level']),
      duration: const Duration(milliseconds: 1000),
      builder: (context, double value, child) {
        return Container(
          padding: const EdgeInsets.all(15), // Reduced padding
          constraints: const BoxConstraints(
            minHeight: 100, // Minimum height to prevent overflow
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha:0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Better space distribution
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skill['name'],
                style: const TextStyle(
                  fontSize: 16, // Slightly smaller font
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.grey[300],
                color: skill['color'],
                minHeight: 7, // Smaller progress bar
                borderRadius: BorderRadius.circular(5),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${(value * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12, // Smaller percentage text
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}