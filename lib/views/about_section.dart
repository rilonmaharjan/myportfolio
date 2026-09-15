import 'package:flutter/material.dart';
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final isTablet = MediaQuery.of(context).size.width < 1050;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : isTablet ? 40 : 100,
        100,
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
          const SizedBox(height: 8),
          Text(
            'Passionate about crafting scalable, high-performance mobile solutions',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.65),
                ),
          ),
          const SizedBox(height: 35),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: [
                    _buildProfileImage(isMobile: true),
                    const SizedBox(height: 25),
                    _buildAboutDetails(context, isMobile: true, isDarkMode: isDarkMode),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: _buildProfileImage(isMobile: false),
                  ),
                  const SizedBox(width: 50),
                  Flexible(
                    flex: 2,
                    child: _buildAboutDetails(context, isMobile: false, isDarkMode: isDarkMode),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 40),

          // Key Highlights Cards Row
          _buildHighlightsRow(isMobile, isTablet, isDarkMode),
        ],
      ),
    );
  }

  Widget _buildProfileImage({required bool isMobile}) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withValues(alpha: 0.25),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/ppp.jpg',
            width: isMobile ? 180 : 320,
            height: isMobile ? 180 : 360,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: isMobile ? 180 : 320,
              height: isMobile ? 180 : 360,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade900, Colors.indigo.shade900],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 70, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Rilon Maharjan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutDetails(BuildContext context, {required bool isMobile, required bool isDarkMode}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! I\'m $name',
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 6),
        Text(
          profession,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w600,
            color: Colors.purpleAccent,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 18),
        Text(
          'I am a $profession with $expereince years of professional software engineering experience. '
          'I specialize in architecting production-ready cross-platform mobile applications for Japanese & international clients, '
          'with focus on clean GetX architecture, offline-first sync, in-app subscriptions',
          style: TextStyle(
            fontSize: isMobile ? 14.5 : 16,
            height: 1.65,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.85),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 25),

        // Personal Info Chips
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildInfoChip(Icons.location_on_outlined, 'Location', location, isDarkMode),
            _buildInfoChip(Icons.email_outlined, 'Email', email, isDarkMode),
            _buildInfoChip(Icons.phone_outlined, 'Phone', phone, isDarkMode),
            _buildInfoChip(Icons.work_outline, 'Status', 'Available for Hire', isDarkMode),
          ],
        ),
        const SizedBox(height: 30),

        // Action CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            FilledButton.icon(
              onPressed: () {
                AppUtils().openLinkWithUrl('mailto:$email?subject=Hiring%20Inquiry%20-%20Flutter%20Developer');
              },
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text('Hire Me'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                AppUtils().openLinkWithUrl(cvUrl);
              },
              icon: const Icon(Icons.description_outlined, size: 18),
              label: const Text('Check CV'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String label, String value, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.purpleAccent),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: isDarkMode ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightsRow(bool isMobile, bool isTablet, bool isDarkMode) {
    final highlights = [
      {
        'number': '$expereince Years',
        'label': 'Flutter Experience',
        'icon': Icons.stars_rounded,
      },
      {
        'number': '15+ Apps',
        'label': 'Production Releases',
        'icon': Icons.storefront_rounded,
      },
      {
        'number': '100%',
        'label': 'Client Satisfaction',
        'icon': Icons.sentiment_very_satisfied_rounded,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: highlights.map((h) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 14 : 20,
                  horizontal: isMobile ? 8 : 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purpleAccent.withValues(alpha: 0.2)),
                ),
                child: Column(
                  children: [
                    Icon(h['icon'] as IconData, color: Colors.purpleAccent, size: isMobile ? 22 : 28),
                    const SizedBox(height: 8),
                    Text(
                      h['number'] as String,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      h['label'] as String,
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}