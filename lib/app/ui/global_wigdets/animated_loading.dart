import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Center(
        child: Container(
          width: 49,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/pokeball.png',
                  width: 50,
                ),
              ),
              Center(
                child: Container(
                  width: 15,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PokeballLoading extends StatefulWidget {
  const PokeballLoading({Key? key}) : super(key: key);

  @override
  State<PokeballLoading> createState() => _PokeballLoading();
}

class _PokeballLoading extends State<PokeballLoading>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpinningContainer(controller: _controller);
  }
}
