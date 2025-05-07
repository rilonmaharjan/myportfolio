import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Bubble> _bubbles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..addListener(() => setState(() {}))
      ..repeat();

    _bubbles = List.generate(8, (index) => Bubble());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: BubblePainter(_bubbles, _controller.value),
    );
  }
}

class Bubble {
  double x = Random().nextDouble();
  double y = Random().nextDouble();
  double radius = Random().nextDouble() * 30 + 20;
  double speed = Random().nextDouble() * 0.0009 + 0.0007;
  Color color = Colors.grey.withValues(alpha: (Random().nextDouble() * 0.2 + 0.05));

  void update(double progress) {
    y -= speed;
    if (y < 0) {
      y = 1.0;
      x = Random().nextDouble();
    }
  }
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;
  final double progress;

  BubblePainter(this.bubbles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (final bubble in bubbles) {
      bubble.update(progress);
      paint.color = bubble.color;
      canvas.drawCircle(
        Offset(bubble.x * size.width, bubble.y * size.height),
        bubble.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
