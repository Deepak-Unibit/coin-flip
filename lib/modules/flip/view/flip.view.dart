import 'package:flip_coin/modules/flip/controller/flip.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            SizedBox(
              height: 200,
              child: Obx(
                () => ModelViewer(
                  key: ValueKey(flipController.autoRotate.value),
                  src: "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
                  animationCrossfadeDuration: 200,
                  cameraControls: true,
                  autoRotate: flipController.autoRotate.value,
                  rotationPerSecond: '180deg',
                  autoRotateDelay: 0,
                  touchAction: TouchAction.panY,
                ),
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
