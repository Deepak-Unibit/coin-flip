import 'package:flip_coin/modules/flip/controller/flip.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

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
              child: Flutter3DViewer(
                src: "assets/lotties/model.glb",
                onLoad: (modelAddress) {
                  Logger().i(modelAddress);
                  // return modelAddress;
                },
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
