// import 'dart:math';
 
// import 'package:flutter/material.dart';
 
// class ScienceAnimation extends StatefulWidget {
//   const ScienceAnimation({super.key});
 
//   @override
//   State<ScienceAnimation> createState() => _ScienceAnimationState();
// }
 
// class _ScienceAnimationState extends State<ScienceAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final List<Particle> particles = [];
//   final Random random = Random();
//   double time = 0;
 
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 60),
//     )..repeat();
   
//     // Initialize particles
//     for (int i = 0; i < 50; i++) {
//       particles.add(Particle(random));
//     }
//   }
 
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         time += 0.01;
//         return CustomPaint(
//           painter: _BackgroundPainter(particles, context.colorScheme, time),
//           willChange: true,
//           isComplex: true,
//           size: Size.infinite,
//         );
//       },
//     );
//   }
// }
 
// class Particle {
//   final Random random;
//   double x, y, size, speed, angle;
//   Color color;
//   double opacity;
//   double baseSize;
 
//   Particle(this.random) :
//     x = random.nextDouble(),
//     y = random.nextDouble(),
//     baseSize = random.nextDouble() * 4 + 1,
//     size = 0,
//     speed = random.nextDouble() * 0.5 + 0.1,
//     angle = random.nextDouble() * 2 * pi,
//     opacity = random.nextDouble() * 0.5 + 0.1,
//     color = Colors.white;
 
//   void update(double time) {
//     // Pulsing effect
//     size = baseSize * (1 + sin(time * speed) * 0.3);
   
//     // Movement
//     x += cos(angle) * speed * 0.01;
//     y += sin(angle) * speed * 0.01;
   
//     // Bounce off edges
//     if (x < 0 || x > 1) angle = pi - angle;
//     if (y < 0 || y > 1) angle = -angle;
   
//     // Random color changes
//     if (random.nextDouble() < 0.005) {
//       angle += (random.nextDouble() - 0.5) * 0.5;
//     }
//   }
// }
 
// class _BackgroundPainter extends CustomPainter {
//   final List<Particle> particles;
//   final ColorScheme colorScheme;
//   final double time;
//   final Paint particlePaint = Paint();
//   final Paint linePaint = Paint();
 
//   _BackgroundPainter(this.particles, this.colorScheme, this.time) {
//     linePaint.strokeWidth = 1.5;
//     linePaint.style = PaintingStyle.stroke;
//   }
 
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Update all particles
//     for (final particle in particles) {
//       particle.update(time);
//     }
 
//     // Draw gradient background
//     final gradient = LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: [
//         colorScheme.surface.withValues(alpha: 0.8),
//         colorScheme.surface.withValues(alpha: 0.9),
//       ],
//     );
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     final backgroundPaint = Paint()..shader = gradient.createShader(rect);
//     canvas.drawRect(rect, backgroundPaint);
 
//     // Draw connecting lines first (behind particles)
//     for (int i = 0; i < particles.length; i++) {
//       for (int j = i + 1; j < particles.length; j++) {
//         final p1 = particles[i];
//         final p2 = particles[j];
//         final dx = p1.x - p2.x;
//         final dy = p1.y - p2.y;
//         final distance = sqrt(dx * dx + dy * dy);
 
//         if (distance < 0.25) {
//           final alpha = (1 - distance / 0.25) * 200;
//           linePaint.color = colorScheme.primary.withValues(alpha: alpha / 255);
         
//           canvas.drawLine(
//             Offset(p1.x * size.width, p1.y * size.height),
//             Offset(p2.x * size.width, p2.y * size.height),
//             linePaint,
//           );
//         }
//       }
//     }
 
//     // Draw particles
//     for (final particle in particles) {
//       final posX = particle.x * size.width;
//       final posY = particle.y * size.height;
     
//       // Glow effect
//       final glowPaint = Paint()
//         ..color = colorScheme.primary.withValues(alpha: particle.opacity * 0.3)
//         ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
     
//       canvas.drawCircle(
//         Offset(posX, posY),
//         particle.size * 2,
//         glowPaint,
//       );
 
//       // Main particle
//       particlePaint.color = colorScheme.primary.withValues(alpha: particle.opacity);
//       canvas.drawCircle(
//         Offset(posX, posY),
//         particle.size,
//         particlePaint,
//       );
//     }
 
//     // Draw subtle grid pattern
//     final gridPaint = Paint()
//       ..color = colorScheme.onSurface.withValues(alpha: 0.05)
//       ..strokeWidth = 0.5;
   
//     const gridSize = 40;
//     for (var x = 0.0; x < size.width; x += gridSize) {
//       canvas.drawLine(
//         Offset(x, 0),
//         Offset(x, size.height),
//         gridPaint,
//       );
//     }
//     for (var y = 0.0; y < size.height; y += gridSize) {
//       canvas.drawLine(
//         Offset(0, y),
//         Offset(size.width, y),
//         gridPaint,
//       );
//     }
//   }
 
//   @override
//   bool shouldRepaint(covariant _BackgroundPainter oldDelegate) => true;
// }
 