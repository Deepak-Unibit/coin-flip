import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/primaryButton.component.dart';
import '../../../utils/assets.util.dart';

class AutoPlayDialogComponent {
  static show({
    required Function onSelectCoinType,
    required RxInt selectedType,
  }) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          constraints: const BoxConstraints(maxWidth: 450),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.theme.colorScheme.surfaceDim,
                context.theme.colorScheme.surfaceBright,
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Text(
                    "Auto Play",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => Get.back(),
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    Text(
                      "Direction",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Obx(
                            () => PrimaryButtonComponent(
                              onClick: () => onSelectCoinType(0),
                              image: AssetsUtil.getHead(),
                              imageSize: 25,
                              gap: 8,
                              text: "Heads",
                              fontSize: 15,
                              height: 40,
                              width: double.infinity,
                              borderRadius: 100,
                              btnColor1: selectedType.value == 0 ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                              btnColor2: selectedType.value == 0 ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Obx(
                            () => PrimaryButtonComponent(
                              onClick: () => onSelectCoinType(1),
                              image: AssetsUtil.getTail(),
                              imageSize: 25,
                              gap: 8,
                              text: "Tails",
                              fontSize: 15,
                              height: 40,
                              width: double.infinity,
                              borderRadius: 100,
                              btnColor1: selectedType.value == 1 ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                              btnColor2: selectedType.value == 1 ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Number of Round",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [10, 100, 500, 1000, 5000, 10000]
                          .map(
                            (amount) => PrimaryButtonComponent(
                              onClick: () {},
                              width: 65,
                              height: 35,
                              text: "$amount",
                              fontSize: 15,
                              btnColor1: context.theme.colorScheme.secondaryContainer,
                              btnColor2: context.theme.colorScheme.secondaryContainer,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              PrimaryButtonComponent(
                onClick: () {},
                text: "Start Auto",
                width: double.infinity,
                fontSize: 18,
                btnColor1: context.theme.colorScheme.tertiary,
                btnColor2: context.theme.colorScheme.tertiaryFixed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
