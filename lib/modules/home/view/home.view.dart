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
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: const Color(0xFF191A2C).withOpacity(1),
                        border: Border.all(color: context.theme.colorScheme.outline),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const Text(
                            "COIN FLIP",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          const SizedBox(height: 30),
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
                                                  AssetsUtil.get10RsHead(),
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                )
                                              : Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationY(3.14159),
                                                  child: Image.asset(
                                                    AssetsUtil.get10RsTail(),
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
                          const SizedBox(height: 10),
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
                                                  context.theme.colorScheme.primaryContainer,
                                                  context.theme.colorScheme.primaryContainer,
                                                ],
                                        ),
                                        border: Border.all(color: const Color(0xFFA988FC).withOpacity(homeController.selectedType.value == 0 ? 1 : 0.1)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            AssetsUtil.get10RsHead(),
                                            height: 35,
                                            width: 35,
                                          ),
                                          Text(
                                            "Head",
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
                                            "Tail",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.onSurface,
                                            ),
                                          ),
                                          Image.asset(
                                            AssetsUtil.get10RsTail(),
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
                            textEditingController: homeController.amountController,
                            hintText: "Enter Amount",
                            textInputType: TextInputType.number,
                            maxLength: 5,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Wrap(
                              runAlignment: WrapAlignment.start,
                              spacing: 10,
                              children: homeController.amountList
                                  .map(
                                    (e) => MaterialButton(
                                      onPressed: () => homeController.onAmountSelect(homeController.amountList.indexOf(e)),
                                      minWidth: 0,
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      child: Container(
                                        height: 40,
                                        width: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          color: context.theme.colorScheme.outline,
                                        ),
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: context.theme.colorScheme.onSurface.withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          MaterialButton(
                            onPressed: () => homeController.onFlipCoin(),
                            minWidth: 0,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Obx(
                              () => Container(
                                width: double.infinity,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  color: homeController.isFlipping.value ? context.theme.colorScheme.onSurface.withOpacity(0.25) : const Color(0xFFE59E05),
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
