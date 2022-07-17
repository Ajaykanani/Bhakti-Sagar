import 'dart:math';
import 'package:flutter/material.dart';

class SpiritAnimation extends StatefulWidget {
  const SpiritAnimation({Key? key}) : super(key: key);

  @override
  State<SpiritAnimation> createState() => _SpiritAnimationState();
}

class _SpiritAnimationState extends State<SpiritAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
