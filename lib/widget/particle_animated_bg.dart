import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  final int numberOfParticles;

  const ParticleBackground({super.key, this.numberOfParticles = 50});

  @override
  // ignore: library_private_types_in_public_api
  _ParticleBackgroundState createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Particle> particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    
    // Initialize particles
    final random = Random();
    for (int i = 0; i < widget.numberOfParticles; i++) {
      particles.add(Particle(
        x: random.nextDouble() * 100,
        y: random.nextDouble() * 100,
        size: random.nextDouble() * 5 + 1,
        speedX: random.nextDouble() * 0.5 - 0.25,
        speedY: random.nextDouble() * 0.5 - 0.25,
        color: Color.fromARGB(
          255,
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
        ).withValues(alpha:0.5),
      ));
    }
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
        // Update particle positions
        for (var particle in particles) {
          particle.x += particle.speedX;
          particle.y += particle.speedY;
          
          // Boundary checking
          if (particle.x < 0 || particle.x > 100) particle.speedX *= -1;
          if (particle.y < 0 || particle.y > 100) particle.speedY *= -1;
        }
        
        return CustomPaint(
          painter: ParticlePainter(particles),
          child: Container(),
        );
      },
    );
  }
}

class Particle {
  double x;
  double y;
  double size;
  double speedX;
  double speedY;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.color,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    
    for (var particle in particles) {
      paint.color = particle.color;
      canvas.drawCircle(
        Offset(
          particle.x / 100 * size.width,
          particle.y / 100 * size.height,
        ),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}