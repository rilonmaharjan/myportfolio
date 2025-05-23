import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/views/about_section.dart';
import 'package:portfolio/views/contact_section.dart';
import 'package:portfolio/views/experience_section.dart';
import 'package:portfolio/views/footer.dart';
import 'package:portfolio/views/header.dart';
import 'package:portfolio/views/project_section.dart';
import 'package:portfolio/views/skill_section.dart';
import 'package:portfolio/widget/gradient_bg.dart';
import 'package:portfolio/widget/science_bg.dart';
// import 'package:portfolio/widget/animated_bubble_bg.dart';
// import 'package:portfolio/widget/liquid_wave_bg.dart';
// import 'package:portfolio/widget/floating_buble_bg.dart';
// import 'package:portfolio/widget/particle_animated_bg.dart';
// import 'package:portfolio/widget/wave_bg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(5, (index) => GlobalKey());
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < (kIsWeb ? 600 : 850);

    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        drawer: isMobile ? _buildMobileDrawer(isMobile) : null,
        body: Stack(
          children: [
            AnimatedGradientBackground(isDarkMode: _isDarkMode,),
            ScienceAnimation(),
            // LiquidWaveBackground(),
            // WaveBackground(),
            // ParticleBackground(),
            // FloatingBubblesBackground(),
            // AnimatedBackground(bubbleCount: isMobile ? 4 : 7,),
            Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      AboutSection(key: _sectionKeys[0]),
                      SkillsSection(key: _sectionKeys[1], isDarkMode: _isDarkMode,),
                      ExperienceSection(key: _sectionKeys[2], isDarkMode: _isDarkMode),
                      ProjectsSection(key: _sectionKeys[3], isDarkMode: _isDarkMode),
                      ContactSection(key: _sectionKeys[4], isDarkMode: _isDarkMode),
                      Footer(isDarkMode: _isDarkMode,),
                    ],
                  )
                ),
                Visibility(
                  visible: isMobile ,
                  child: _buildMobileAppBar()
                ),
                Visibility(
                  visible: !isMobile,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Header(
                        sectionKeys: _sectionKeys,
                        toggleTheme: _toggleTheme,
                        scrollController: _scrollController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildMobileAppBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: SafeArea(
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  Text(
                    'My Portfolio',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                      onPressed: _toggleTheme,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer(isMobile) {
    return Drawer(
      backgroundColor: _isDarkMode ? Colors.black : const Color.fromARGB(255, 244, 233, 253),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple.withValues(alpha: isMobile ? 0.2 : 0.3)
            ),
            child: Text(
              'My Portfolio',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.person),
            onTap: () => _scrollToSection(0, isMobile),
          ),
          ListTile(
            title: const Text('Skills'),
            leading: const Icon(Icons.code),
            onTap: () => _scrollToSection(1, isMobile),
          ),
          ListTile(
            title: const Text('Experience'),
            leading: const Icon(Icons.work),
            onTap: () => _scrollToSection(2, isMobile),
          ),
          ListTile(
            title: const Text('Projects'),
            leading: const Icon(Icons.apps),
            onTap: () => _scrollToSection(3, isMobile),
          ),
          ListTile(
            title: const Text('Contact'),
            leading: const Icon(Icons.email),
            onTap: () => _scrollToSection(4, isMobile),
          ),
          const Divider(),
          ListTile(
            title: Text(_isDarkMode ? 'Light Mode' : 'Dark Mode'),
            leading: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onTap: () {
              _toggleTheme();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _scrollToSection(int index, isMobile) async {
    final key = _sectionKeys[index];
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.8, // Align to 30% from top of viewport
      );
      if (isMobile) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context); // Close drawer after navigation
      }
    }
  }
}