import 'package:flutter/material.dart';
import 'package:portfolio/constant/constant.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1000;

    return Container(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : isTablet ? 40 : 100,
        120,
        isMobile ? 20 : isTablet ? 40 : 100,
        isMobile ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile)
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.jpg?s=612x612&w=0&k=20&c=m_9Xg7mIqE8E4Zx2bVd_n1DMu2b2OvD97GhNQsJmQeE=',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello! I\'m $name',
                      style: TextStyle(
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'I\'m a passionate $profession with $expereince years of experience in building amazing digital experiences. '
                      'I specialize in $skills and love to create efficient, scalable, and user-friendly applications.',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildInfoItem('Location:', location),
                        _buildInfoItem('Email:', email),
                        _buildInfoItem('Phone:', phone),
                        _buildInfoItem('Freelance:', 'Available'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Download CV',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withValues(alpha:0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Text(value),
        ],
      ),
    );
  }
}