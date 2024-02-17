import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 100;
    height = random.nextInt(600) + 100;
    borderRadius = random.nextInt(100).toDouble();

    color = Color.fromARGB(
      255, 
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255)
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width <= 0 ? 100 : width,
          height: height <= 0 ? 100: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              borderRadius < 0 ? 0 : borderRadius
            )
          ),
        ),
      ),
    );
  }
}