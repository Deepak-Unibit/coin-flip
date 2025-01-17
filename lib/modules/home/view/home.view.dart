import 'package:flip_coin/components/textField.component.dart';
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
      backgroundColor: const Color(0xFF181A26),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xFF181A26),
              constraints: const BoxConstraints(
                maxWidth: 550,
              ),
              // child: Image.asset(
              //   AssetsUtil.getBackgroundLottie(),
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: const Color(0xFF191A2C).withOpacity(1),
                        border: Border.all(color: const Color(0xFF1E2234)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            "COIN FLIP",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
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
                              Flexible(
                                child: MaterialButton(
                                  onPressed: () => homeController.onSelectType(0),
                                  minWidth: 0,
                                  visualDensity: VisualDensity.compact,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  child: Obx(
                                    () => Container(
                                      width: double.infinity,
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100), topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                                        gradient: LinearGradient(
                                          colors: homeController.selectedType.value == 0
                                              ? [
                                                  const Color(0xFF6F3BFC),
                                                  const Color(0xFF8C60FE),
                                                ]
                                              : [
                                                  const Color(0xFF111825),
                                                  const Color(0xFF111825),
                                                ],
                                        ),
                                        border: Border.all(color: const Color(0xFFA988FC).withOpacity(homeController.selectedType.value == 0 ? 1 : 0.1)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            AssetsUtil.getHead(),
                                            height: 35,
                                            width: 35,
                                          ),
                                          Text(
                                            "Rupee",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.onSurface,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Flexible(
                                child: MaterialButton(
                                  onPressed: () => homeController.onSelectType(1),
                                  minWidth: 0,
                                  visualDensity: VisualDensity.compact,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  child: Obx(
                                    () => Container(
                                      width: double.infinity,
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                          colors: homeController.selectedType.value == 1
                                              ? [
                                                  const Color(0xFF6F3BFC),
                                                  const Color(0xFF8C60FE),
                                                ]
                                              : [
                                                  const Color(0xFF111825),
                                                  const Color(0xFF111825),
                                                ],
                                        ),
                                        border: Border.all(color: const Color(0xFFA988FC).withOpacity(homeController.selectedType.value == 1 ? 1 : 0.1)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 10),
                                          Text(
                                            "Dollar",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.onSurface,
                                            ),
                                          ),
                                          Image.asset(
                                            AssetsUtil.getDollar(),
                                            height: 35,
                                            width: 35,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          TextFieldComponent(
                            textEditingController: TextEditingController(),
                            hintText: "Enter Amount",
                            textInputType: TextInputType.number,
                            maxLength: 5,
                          ),
                          const SizedBox(height: 10),
                          MaterialButton(
                            onPressed: () => homeController.onFlipCoin(),
                            minWidth: 0,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFE59E05),
                              ),
                              child: const Text(
                                "Flip Coin",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
