import 'dart:ui';
import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  final bool isDarkMode;
  const SkillsSection({super.key, required this.isDarkMode});

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
    {'name': 'HTML/CSS', 'level': 0.65, 'color': Colors.green},
  ];

  late List<bool> isHoverList;

  @override
  void initState() {
    super.initState();
    isHoverList = List.filled(skills.length, false);
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
      color: Colors.grey.withValues(alpha: widget.isDarkMode ? 0.1 : 0.15),
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
                  return _buildSkillItem(skills[index], index);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(Map<String, dynamic> skill, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHoverList[index] = true),
      onExit: (_) => setState(() => isHoverList[index] = false),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: skill['level']),
        duration: const Duration(milliseconds: 1000),
        builder: (context, double value, child) {
          return AnimatedOpacity(
            opacity: isHoverList[index] ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  constraints: const BoxConstraints(minHeight: 100),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha:isHoverList[index] ? 0.4 : 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skill['name'],
                        style: const TextStyle(
                          fontSize: 16,
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
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${(value * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 12,
                            color: widget.isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
