import 'package:flip_coin/modules/flip/controller/flip.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class FlipView extends StatelessWidget {
  FlipView({super.key});

  final FlipController flipController = Get.put(FlipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            const Text(
              "Flip",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const SizedBox(
              height: 200,
              child: ModelViewer(
                src: "assets/lotties/model.glb",
                autoPlay: true,
                ar: false,
                animationCrossfadeDuration: 200,
                cameraControls: true,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => flipController.flipCard(),
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size.zero),
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20)),
                splashFactory: InkSplash.splashFactory,
              ),
              child: const Text(
                "Flip Card",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
