import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final List<GlobalKey> sectionKeys;
  final VoidCallback toggleTheme;
  final ScrollController scrollController;

  const Header({
    super.key,
    required this.sectionKeys,
    required this.toggleTheme,
    required this.scrollController,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _activeSectionIndex = 0;

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

    // Listen to scroll changes
    widget.scrollController.addListener(_updateActiveSection);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateActiveSection);
    _controller.dispose();
    super.dispose();
  }

  void _updateActiveSection() {
    final scrollPosition = widget.scrollController.position.pixels;
    final screenHeight = MediaQuery.of(context).size.height;
    final viewportCenter = scrollPosition + screenHeight / 2;

    double closestDistance = double.infinity;
    int newActiveIndex = 0;

    for (int i = 0; i < widget.sectionKeys.length; i++) {
      final key = widget.sectionKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero).dy + scrollPosition;
          final sectionCenter = position + box.size.height / 2;
          final distance = (sectionCenter - viewportCenter).abs();

          if (distance < closestDistance) {
            closestDistance = distance;
            newActiveIndex = i;
          }
        }
      }
    }

    if (newActiveIndex != _activeSectionIndex) {
      setState(() {
        _activeSectionIndex = newActiveIndex;
      });
    }
  }


  Future<void> _scrollToSection(int index) async {
    final key = widget.sectionKeys[index];
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1, // adjust this if needed
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1000;
    final theme = Theme.of(context);

    return Container(
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : isTablet ? 40 : 100,
          vertical: 8,
        ),
        child:  Row(
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
    
    // Navigation items
    if (!isMobile)
      Flexible(
        child: FadeTransition(
          opacity: _animation,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNavItem('About', 0),
                _buildNavItem('Skills', 1),
                _buildNavItem('Experience', 2),
                _buildNavItem('Projects', 3),
                _buildNavItem('Contact', 4),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(
                    theme.brightness == Brightness.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  onPressed: widget.toggleTheme,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
      ],
    ),
    
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    final isActive = _activeSectionIndex == index;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => _scrollToSection(index),
        style: TextButton.styleFrom(
          foregroundColor: isActive
              ? theme.colorScheme.primary
              : theme.textTheme.bodyLarge?.color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isActive)
              Container(
                height: 2,
                width: 16,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}