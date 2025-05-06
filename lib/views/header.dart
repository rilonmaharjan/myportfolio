import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final List<GlobalKey> sectionKeys;
  final VoidCallback toggleTheme;

  const Header({
    super.key,
    required this.sectionKeys,
    required this.toggleTheme,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _scrollToSection(int index) async {
    final key = widget.sectionKeys[index];
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1000;
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: theme.appBarTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : isTablet ? 40 : 100,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo/Title
                Flexible(
                  child: FadeTransition(
                    opacity: _animation,
                    child: Text(
                      'My Portfolio',
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // Navigation items or menu button
                if (!isMobile)
                  Flexible(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Row(
                        children: [
                          Spacer(),
                          _buildNavItem('About', 0),
                          _buildNavItem('Skills', 1),
                          _buildNavItem('Experience', 2),
                          _buildNavItem('Projects', 3),
                          _buildNavItem('Contact', 4),
                          const SizedBox(width: 16),
                          // Theme toggle button
                          IconButton(
                            icon: Icon(
                              theme.brightness == Brightness.dark
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                            ),
                            onPressed: widget.toggleTheme,
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(String title, int index) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => _scrollToSection(index),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}