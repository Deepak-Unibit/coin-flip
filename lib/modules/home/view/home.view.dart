import 'package:flip_coin/components/textField.component.dart';
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
      backgroundColor: context.theme.colorScheme.surfaceBright,
      body: Center(
        child: Container(
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: context.theme.colorScheme.primaryContainer.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Coin Flip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      "₹ 103932.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
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
                    onClick: () => homeController.onWalletClick(),
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
                  Obx(
                    () => homeController.showLottie.value
                        ? LottieHelper.lottie(
                            animationAsset: AssetsUtil.getGlowingLottie(),
                            height: 200,
                            width: 200,
                          )
                        : const SizedBox(
                            height: 200,
                            width: 200,
                          ),
                  ),
                  Obx(
                    () => homeController.showLottie.value
                        ? Image.asset(
                            AssetsUtil.getGlow(),
                            height: 168,
                            width: 168,
                          )
                        : const SizedBox.shrink(),
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
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () => homeController.decreaseAmount(),
                          minWidth: 30,
                          height: 30,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                        const SizedBox(width: 10),
                        Flexible(
                          child: TextFieldComponent(
                            textEditingController: homeController.amountController,
                            hintText: "Enter Amount",
                            textInputType: TextInputType.number,
                            maxLength: 4,
                            height: 45,
                          ),
                        ),
                        const SizedBox(width: 10),
                        MaterialButton(
                          onPressed: () => homeController.increaseAmount(),
                          minWidth: 30,
                          height: 30,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                      ],
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
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.amountList.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemBuilder: (context, index) => PrimaryButtonComponent(
                          onClick: () => homeController.onAmountSelect(homeController.amountList[index]),
                          width: 56,
                          height: 30,
                          text: "₹${homeController.amountList[index]}",
                          fontSize: 14,
                          btnColor1: context.theme.colorScheme.secondaryContainer,
                          btnColor2: context.theme.colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  PrimaryButtonComponent(
                    onClick: () => homeController.onAutoPlayClick(),
                    image: AssetsUtil.getAutoPlayIcon(),
                    height: 40,
                    width: 50,
                    borderRadius: 100,
                    btnColor1: context.theme.colorScheme.scrim,
                    btnColor2: context.theme.colorScheme.surfaceTint,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Obx(
                      () => PrimaryButtonComponent(
                        onClick: () => homeController.onSelectCoinType(0),
                        image: AssetsUtil.getHead(),
                        imageSize: 25,
                        gap: 8,
                        text: "Heads",
                        fontSize: 15,
                        height: 40,
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
                        onClick: () => homeController.onSelectCoinType(1),
                        image: AssetsUtil.getTail(),
                        imageSize: 25,
                        gap: 8,
                        text: "Tails",
                        fontSize: 15,
                        height: 40,
                        width: double.infinity,
                        borderRadius: 100,
                        btnColor1: homeController.selectedType.value == 1 ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                        btnColor2: homeController.selectedType.value == 1 ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              PrimaryButtonComponent(
                onClick: homeController.onFlipCoin,
                text: "Flip Coin",
                fontSize: 18,
                height: 45,
                width: double.infinity,
                btnColor1: context.theme.colorScheme.tertiary,
                btnColor2: context.theme.colorScheme.tertiaryFixed,
              ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Share to:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Image.asset(
                      AssetsUtil.getFacebookIcon(),
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(width: 2),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Image.asset(
                      AssetsUtil.getWhatsAppIcon(),
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(width: 2),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Image.asset(
                      AssetsUtil.getXIcon(),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
