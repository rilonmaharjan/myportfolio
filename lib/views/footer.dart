import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 30,
      ),
      color: Colors.grey.withValues(alpha:0.05),
      child: Column(
        children: [
          if (!isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Portfolio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'A showcase of my work and skills as a Flutter developer.',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 15),
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 15),
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 15),
                    _buildSocialIcon(Icons.facebook),
                  ],
                ),
              ],
            ),
          if (isMobile)
            Column(
              children: [
                const Text(
                  'My Portfolio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'A showcase of my work and skills as a Flutter developer.',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 15),
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 15),
                    _buildSocialIcon(Icons.facebook),
                    const SizedBox(width: 15),
                    _buildSocialIcon(Icons.facebook),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 30),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} My Portfolio. All rights reserved.',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
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
    );
  }
}