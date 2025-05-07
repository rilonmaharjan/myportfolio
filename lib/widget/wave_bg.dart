import 'dart:math';

import 'package:flutter/material.dart';

class WaveBackground extends StatefulWidget {
  const WaveBackground({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaveBackgroundState createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<WaveBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
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
          painter: WavePainter(_controller.value),
          size: Size.infinite,
          child: Container(),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withValues(alpha: .4)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.8);

    // Create wave effect
    for (double i = 0; i < size.width; i++) {
      path.lineTo(
        i,
        size.height * 0.8 +
            sin((i / size.width * 4 * pi) + (animationValue * 2 * pi)) * 20,
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}