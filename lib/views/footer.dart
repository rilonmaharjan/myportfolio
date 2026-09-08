import 'package:flutter/material.dart';
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils.dart';

class Footer extends StatelessWidget {
  final bool isDarkMode;
  const Footer({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 500;
    final isTablet = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: isMobile ? 30 : 50,
      ),
      color: Colors.grey.withValues(alpha: isDarkMode ? 0.05 : 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isMobile && !isTablet)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAboutSection(),
                _buildSocialIconsRow(),
              ],
            ),
          if (isMobile || isTablet)
            Column(
              children: [
                _buildAboutSection(isMobile: true, isTablet: true),
                const SizedBox(height: 20),
                _buildSocialIconsRow(center: true),
              ],
            ),
          const SizedBox(height: 25),
          const Divider(color: Colors.grey),
          const SizedBox(height: 15),
          Text(
            '© ${DateTime.now().year} $name. Built with Flutter & Dart.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection({bool isMobile = false, bool isTablet = false}) {
    return Column(
      crossAxisAlignment:
          isMobile || isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Senior Flutter Developer — Engineering high quality mobile apps.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIconsRow({bool center = false}) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        _buildSocialIcon(
          Icons.code,
          'GitHub',
          () => AppUtils().openLinkWithUrl('https://github.com/rilonmaharjan'),
        ),
        const SizedBox(width: 12),
        _buildSocialIcon(
          Icons.email,
          'Email',
          () => AppUtils().openLinkWithUrl('mailto:$email'),
        ),
        const SizedBox(width: 12),
        _buildSocialIcon(
          Icons.facebook,
          'Facebook',
          () => AppUtils().openLinkWithUrl('https://www.facebook.com/rilonmhrzn'),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: isDarkMode ? 0.25 : 0.2),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.purpleAccent.withValues(alpha: 0.3)),
          ),
          child: Icon(
            icon,
            color: isDarkMode ? Colors.white : Colors.black87,
            size: 20,
          ),
        ),
      ),
    );
  }
}
