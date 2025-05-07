import 'dart:math';
import 'package:flutter/material.dart';

class FloatingBubblesBackground extends StatefulWidget {
  const FloatingBubblesBackground({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FloatingBubblesBackgroundState createState() => _FloatingBubblesBackgroundState();
}

class _FloatingBubblesBackgroundState extends State<FloatingBubblesBackground> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> bubbles = [];
  final Random random = Random();
  final int bubbleCount = 30;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < bubbleCount; i++) {
      bubbles.add(Bubble(random));
    }
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        _updateBubbles();
        return CustomPaint(
          painter: _BubblePainter(bubbles),
          child: Container(),
        );
      },
    );
  }

  void _updateBubbles() {
    for (final bubble in bubbles) {
      bubble.update();
    }
  }
}

class Bubble {
  final Random random;
  double x;
  double y;
  double size;
  double speedX;
  double speedY;
  double alpha;
  Color color;
  double rotation;
  double rotationSpeed;

  Bubble(this.random)
      : x = random.nextDouble() * 100,
        y = random.nextDouble() * 100,
        size = random.nextDouble() * 20 + 10,
        speedX = random.nextDouble() * 0.5 - 0.25,
        speedY = random.nextDouble() * 0.5 - 0.25,
        alpha = random.nextDouble() * 0.5 + 0.3,
        rotation = random.nextDouble() * 2 * pi,
        rotationSpeed = random.nextDouble() * 0.1 - 0.05,
        color = Color.fromARGB(
          ((random.nextDouble() * 0.5 + 0.3) * 255).toInt(),
          random.nextInt(200),
          random.nextInt(200),
          random.nextInt(200),
        );

  void update() {
    x += speedX;
    y += speedY;
    rotation += rotationSpeed;

    // Bounce on boundaries
    if (x < 0 || x > 100) speedX *= -1;
    if (y < 0 || y > 100) speedY *= -1;

    // Occasionally change direction
    if (random.nextDouble() < 0.01) {
      speedX = random.nextDouble() * 0.5 - 0.25;
      speedY = random.nextDouble() * 0.5 - 0.25;
    }
  }
}

class _BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;

  _BubblePainter(this.bubbles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final bubble in bubbles) {
      final paint = Paint()..color = bubble.color;
      final center = Offset(
        bubble.x / 100 * size.width,
        bubble.y / 100 * size.height,
      );
      
      // Draw bubble with highlight for 3D effect
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(bubble.rotation);
      
      // Main bubble
      canvas.drawCircle(
        Offset.zero,
        bubble.size,
        paint,
      );
      
      // Bubble highlight
      canvas.drawCircle(
        Offset(-bubble.size * 0.3, -bubble.size * 0.3),
        bubble.size * 0.3,
        Paint()..color = Colors.white.withValues(alpha:0.3),
      );
      
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) => true;
}