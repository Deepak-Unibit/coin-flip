import 'dart:ui';
import 'package:flip_coin/components/primaryButton.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/lottie.helper.dart';
import '../../../utils/assets.util.dart';

class ResultDialogComponent {
  static show({required num amount, required num coinType, required bool isWin}) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.black.withOpacity(0.25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 500),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: LottieHelper.lottie(
                      animationAsset: isWin ? AssetsUtil.getConfettiLottie() : AssetsUtil.getLostAnimation(),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: isWin ? "Congratulations! You Get " : "Sorry! You Lost ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.onSurface,
                        ),
                        children: [
                          TextSpan(
                            text: " ₹ $amount",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        LottieHelper.lottie(
                          animationAsset: AssetsUtil.getGlowingLottie(),
                          height: 135,
                          width: 135,
                        ),
                        Image.asset(
                          AssetsUtil.getGlow(),
                          height: 120,
                          width: 120,
                        ),
                        Image.asset(
                          coinType == 0 ? AssetsUtil.getHead() : AssetsUtil.getTail(),
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "₹ $amount",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: isWin ? context.theme.colorScheme.scrim : context.theme.colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButtonComponent(
                      text: "GO ON!",
                      onClick: () => Get.back(),
                      height: 35,
                      width: 150,
                      btnColor1: context.theme.colorScheme.tertiary,
                      btnColor2: context.theme.colorScheme.tertiaryFixed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
