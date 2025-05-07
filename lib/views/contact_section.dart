import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils.dart';

class ContactSection extends StatefulWidget {
  final bool isDarkMode;
  const ContactSection({super.key, required this.isDarkMode});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 40 : 100,
        vertical: isMobile ? 40 : 60,
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 50,
              vertical: isMobile ? 20 : 50,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha:0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get In Touch',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                isTablet
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo(
                              Icons.email, 'Email', email, () => AppUtils().openLinkWithUrl('mailto:$email')),
                          const SizedBox(height: 30),
                          _buildContactInfo(Icons.phone, 'Phone', phone, () => AppUtils().openLinkWithUrl('tel:$phone')),
                          const SizedBox(height: 30),
                          _buildContactInfo(
                              Icons.location_on, 'Location', location, (){}),
                          const SizedBox(height: 40),
                          _buildForm(isMobile),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildContactInfo(
                                    Icons.email, 'Email', email, () => AppUtils().openLinkWithUrl('mailto:$email')),
                                const SizedBox(height: 30),
                                _buildContactInfo(
                                    Icons.phone, 'Phone', phone, () => AppUtils().openLinkWithUrl('tel:$phone')),
                                const SizedBox(height: 30),
                                _buildContactInfo(Icons.location_on, 'Location',
                                    location, (){}),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),
                          Flexible(
                            flex: 2,
                            child: _buildForm(isMobile),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(bool isMobile) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              if (!isMobile) const SizedBox(width: 20),
              if (!isMobile)
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Your Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
            ],
          ),
          if (isMobile) const SizedBox(height: 20),
          if (isMobile)
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Your Message',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message sent successfully!')),
                );
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: const Text(
              'Send Message',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String value, VoidCallback onTap) {
    return InkWell(
      onTap : onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.isDarkMode == true ? Colors.grey[400] : Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
