import 'dart:math';

import 'package:flutter/material.dart';

class LiquidWaveBackground extends StatefulWidget {
  const LiquidWaveBackground({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LiquidWaveBackgroundState createState() => _LiquidWaveBackgroundState();
}

class _LiquidWaveBackgroundState extends State<LiquidWaveBackground> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Color> gradientColors = [
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.deepPurple,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
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
        return CustomPaint(
          painter: _LiquidWavePainter(
            progress: _controller.value,
            colors: gradientColors,
          ),
          size: Size.infinite,
          child: Container(),
        );
      },
    );
  }
}

class _LiquidWavePainter extends CustomPainter {
  final double progress;
  final List<Color> colors;

  _LiquidWavePainter({
    required this.progress,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);

    // Create multiple layered waves
    for (int i = 0; i < 3; i++) {
      final waveHeight = 30.0 * (i + 1);
      final waveSpeed = 0.5 * (i + 1);
      
      for (double x = 0; x < size.width; x++) {
        final y = size.height * 0.7 + 
            sin((x / size.width * 4 * pi * waveSpeed) + 
            (progress * 2 * pi)) * waveHeight;
        if (x == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
      
      // Adjust opacity for depth
      paint.color = colors[i % colors.length].withValues(alpha:0.6 / (i + 1));
      canvas.drawPath(path, paint);
      path.reset();
    }
  }

  @override
  bool shouldRepaint(_LiquidWavePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}