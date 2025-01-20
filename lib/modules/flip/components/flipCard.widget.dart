import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/flip.controller.dart';

class FlipCardWidget extends StatelessWidget {
  const FlipCardWidget({super.key, required this.front, required this.back, required this.flipController});

  final FlipController flipController;
  final Image front;
  final Image back;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        precacheImage(front.image, context);
        precacheImage(back.image, context);
      },
    );
    return Obx(
      () => AnimatedBuilder(
        animation: flipController.animationController.value!,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(flipController.animationController.value!.value * -pi),
            alignment: Alignment.center,
            child: flipController.animationController.value!.value < 0.5 ? front : back,
          );
        },
      ),
    );
  }
}
