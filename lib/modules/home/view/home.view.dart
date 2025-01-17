import 'package:flip_coin/modules/home/controller/home.controller.dart';
import 'package:flip_coin/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../helper/lottie.helper.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E0E),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 550,
              ),
              child: Image.asset(
                AssetsUtil.getBackgroundLottie(),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "COIN FLIP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 50),
                    Obx(
                      () => AnimatedBuilder(
                          animation: homeController.controller!,
                          builder: (context, child) {
                            return Transform(
                              alignment: FractionalOffset.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.00005)
                                ..rotateY(math.pi * homeController.animation.value),
                              child: Container(
                                // color: Colors.grey,
                                height: 120,
                                width: 120,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  homeController.resultCoin.value == 0
                                      ? AssetsUtil.getHead()
                                      : homeController.resultCoin.value == 1
                                          ? AssetsUtil.getDollar()
                                          : AssetsUtil.getBackground(),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => MaterialButton(
                            onPressed: () => homeController.onSelectType(0),
                            minWidth: 150,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            color: homeController.selectedType.value == 0 ? const Color(0xFFE59E05) : const Color(0xFF1A1A1A),
                            height: 50,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.currency_rupee,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Obx(
                          () => MaterialButton(
                            onPressed: () => homeController.onSelectType(1),
                            minWidth: 150,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            color: homeController.selectedType.value == 1 ? const Color(0xFFE59E05) : const Color(0xFF1A1A1A),
                            height: 50,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                              Icons.attach_money,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () => homeController.onFlipCoin(),
                      minWidth: 0,
                      visualDensity: VisualDensity.compact,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: const Color(0xFFE59E05),
                      height: 50,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        "Flip",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => homeController.showConfetti.value
                  ? LottieHelper.lottie(
                      animationAsset: AssetsUtil.getConfettiLottie(),
                      repeat: true,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class CoinFlipUsingImageGIF extends StatelessWidget {
  const CoinFlipUsingImageGIF({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Padding(
            padding: EdgeInsets.only(bottom: homeController.coinStatus.value == 2 ? 0 : 25),
            child: Image.asset(
              homeController.coinStatus.value == 0
                  ? AssetsUtil.getHead()
                  : homeController.coinStatus.value == 1
                      ? AssetsUtil.getTail()
                      : AssetsUtil.getRotatingCoin(),
              height: homeController.coinStatus.value == 2 ? 150 : 100,
              width: homeController.coinStatus.value == 2 ? 150 : 100,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            homeController.onFlip();
          },
          child: const Text('Flip Coin'),
        ),
      ],
    );
  }
}
