import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key,});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedGradientBackgroundState createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  List<Color> colorList = [
        Colors.blue.withValues(alpha:0.2),
        Colors.purple.withValues(alpha:0.2),
        Colors.deepPurple.withValues(alpha:0.2),
        Colors.indigo.withValues(alpha:0.2),
      ];

  final List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.blue;
  Color topColor = Colors.indigo;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
    
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          bottomColor = Color.lerp(
            bottomColor,
            colorList[index],
            _animation.value,
          )!;
          
          topColor = Color.lerp(
            topColor,
            colorList[(index + 1) % colorList.length],
            _animation.value,
          )!;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            index = (index + 1) % colorList.length;
          });
          _controller.reset();
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),
      child: Container(), // Your content goes here
    );
  }
}