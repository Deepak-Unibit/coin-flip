import 'package:flip_coin/modules/home/controller/home.controller.dart';
import 'package:flip_coin/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../components/primaryButton.component.dart';
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
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(maxWidth: 450),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.theme.colorScheme.surfaceDim,
                    context.theme.colorScheme.surfaceBright,
                  ],
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Coin Flip",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButtonComponent(
                        onClick: () {},
                        text: "History",
                        image: AssetsUtil.getHistoryIcon(),
                      ),
                      PrimaryButtonComponent(
                        onClick: () {},
                        text: "Wallet",
                        image: AssetsUtil.getWalletIcon(),
                        btnColor1: context.theme.colorScheme.primary,
                        btnColor2: context.theme.colorScheme.primaryFixed,
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          AssetsUtil.getGlowingAnimation(),
                          height: 350,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Obx(
                        () => AnimatedBuilder(
                            animation: homeController.controller!,
                            builder: (context, child) {
                              return Transform(
                                alignment: FractionalOffset.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.00005)
                                  ..rotateY(-math.pi * homeController.animation.value),
                                child: Container(
                                  // color: Colors.grey,
                                  height: 120,
                                  width: 120,
                                  alignment: Alignment.center,
                                  child: (homeController.animation.value < 0.5 ||
                                          [
                                            [1.5, 2.5],
                                            [3.5, 4.5],
                                            [5.5, 6.5],
                                            [7.5, 8.5],
                                            [9.5, 10.5],
                                            [11.5, 12.5],
                                            [13.5, 14.5],
                                            [15.5, 16.5],
                                            [17.5, 18.5],
                                          ].any((range) => homeController.animation.value > range[0] && homeController.animation.value < range[1]))
                                      ? Image.asset(
                                          AssetsUtil.getHead(),
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        )
                                      : Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(3.14159),
                                          child: Image.asset(
                                            AssetsUtil.getTail(),
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      color: context.theme.colorScheme.primaryContainer.withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Bet",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Icon(
                                Icons.info,
                                size: 15,
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: context.theme.colorScheme.surfaceContainer,
                            border: Border.all(color: context.theme.colorScheme.primary),
                          ),
                          child: Row(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                minWidth: 30,
                                height: 30,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  side: BorderSide(color: context.theme.colorScheme.outline),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "500",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(width: 10),
                              MaterialButton(
                                onPressed: () {},
                                minWidth: 30,
                                height: 30,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  side: BorderSide(color: context.theme.colorScheme.outline),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              const Spacer(),
                              MaterialButton(
                                onPressed: () {},
                                minWidth: 30,
                                height: 30,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  side: BorderSide(color: context.theme.colorScheme.outline),
                                ),
                                child: Icon(
                                  Icons.currency_rupee_rounded,
                                  size: 18,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "*Select the amount",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.outline.withOpacity(0.55),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 10,
                          children: [50, 100, 200, 500, 1000]
                              .map(
                                (amount) => PrimaryButtonComponent(
                                  onClick: () {},
                                  width: 56,
                                  height: 30,
                                  text: "₹$amount",
                                  fontSize: 14,
                                  btnColor1: context.theme.colorScheme.secondaryContainer,
                                  btnColor2: context.theme.colorScheme.secondaryContainer,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      PrimaryButtonComponent(
                        onClick: () {},
                        image: AssetsUtil.getAutoPlayIcon(),
                        height: 35,
                        width: 50,
                        borderRadius: 100,
                        btnColor1: context.theme.colorScheme.scrim,
                        btnColor2: context.theme.colorScheme.surfaceTint,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Obx(
                          () => PrimaryButtonComponent(
                            onClick: () => homeController.onSelectType(0),
                            image: AssetsUtil.getHead(),
                            imageSize: 20,
                            gap: 8,
                            text: "Heads",
                            fontSize: 15,
                            height: 35,
                            width: double.infinity,
                            borderRadius: 100,
                            btnColor1: homeController.selectedType.value == 0 ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                            btnColor2: homeController.selectedType.value == 0 ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Obx(
                          () => PrimaryButtonComponent(
                            onClick: () => homeController.onSelectType(1),
                            image: AssetsUtil.getTail(),
                            imageSize: 20,
                            gap: 8,
                            text: "Tails",
                            fontSize: 15,
                            height: 35,
                            width: double.infinity,
                            borderRadius: 100,
                            btnColor1: homeController.selectedType.value == 1 ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                            btnColor2: homeController.selectedType.value == 1 ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PrimaryButtonComponent(
                    onClick: homeController.onFlipCoin,
                    text: "Flip Coin",
                    fontSize: 18,
                    height: 45,
                    width: double.infinity,
                    btnColor1: context.theme.colorScheme.tertiary,
                    btnColor2: context.theme.colorScheme.tertiaryFixed,
                  ),
                ],
              ),
            ),
            Obx(
              () => homeController.showConfetti.value
                  ? Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: LottieHelper.lottie(
                        animationAsset: AssetsUtil.getConfettiLottie(),
                        repeat: false,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
