import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils.dart';

class Footer extends StatelessWidget {
  final bool isDarkMode;
  const Footer({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 400;
    final isTablet = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: isMobile ? 40 : 60,
      ),
      color: Colors.grey.withValues(alpha:0.0),
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
          const SizedBox(height: 30),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} My Portfolio. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
              fontSize: 12,
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
          'My Portfolio',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'A showcase of my work and skills as a Flutter developer.',
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
        _buildSocialIcon(Icons.facebook, () => AppUtils().openLinkWithUrl(kIsWeb ? "https://www.facebook.com/rilonmhrzn" : Platform.isIOS ? "fb://profile/101948562518590" : "fb://page/101948562518590")),
        const SizedBox(width: 15),
        _buildSocialIcon(Icons.email, () { if(!kIsWeb) {AppUtils().openLinkWithUrl('mailto:$email');}}),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {    
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
