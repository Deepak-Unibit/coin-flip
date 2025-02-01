import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/primaryButton.component.dart';
import '../../../utils/assets.util.dart';

class AutoPlayDialogComponent {
  static show({
    required List<int> roundList,
    required RxInt selectedType,
    required RxInt selectedRound,
    required RxInt cashDecreaseAmount,
    required RxInt singleWinAmount,
    required RxBool cashDecreaseSwitch,
    required RxBool singleWinSwitch,
    required Function onSelectCoinType,
    required Function onSelectRound,
    required Function onCashDecreaseSwitchClick,
    required Function onSingleWinSwitchClick,
    required Function onDecreaseCashDecrease,
    required Function onIncreaseCashDecrease,
    required Function onDecreaseSingleWin,
    required Function onIncreaseSingleWin,
  }) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 450),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: context.theme.colorScheme.outline),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
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
                // Number of Round
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
                  children: roundList
                      .map(
                        (round) => Obx(
                          () => PrimaryButtonComponent(
                            onClick: () => onSelectRound(round),
                            width: 65,
                            height: 35,
                            text: "$round",
                            fontSize: 15,
                            btnColor1: selectedRound.value == round ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                            btnColor2: selectedRound.value == round ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                          ),
                        ),
                      )
                      .toList(),
                ),
                // Stop Loss
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      height: 25,
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Obx(
                          () => Switch(
                            value: cashDecreaseSwitch.value,
                            onChanged: (value) => onCashDecreaseSwitchClick(),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            thumbColor: WidgetStatePropertyAll(cashDecreaseSwitch.value ? context.theme.colorScheme.onSurface : context.theme.colorScheme.outline),
                            activeTrackColor: context.theme.colorScheme.surfaceContainerLow,
                            inactiveTrackColor: context.theme.colorScheme.secondaryContainer,
                            trackOutlineWidth: const WidgetStatePropertyAll(1),
                            trackOutlineColor: WidgetStatePropertyAll(context.theme.colorScheme.outline.withOpacity(0.5)),
                            splashRadius: 0,
                            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                            hoverColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Stop if cash decreases by",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Opacity(
                        opacity: cashDecreaseSwitch.value ? 1 : 0.5,
                        child: MaterialButton(
                          onPressed: cashDecreaseSwitch.value ? () => onDecreaseCashDecrease() : () {},
                          minWidth: 24,
                          height: 24,
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
                            size: 14,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Opacity(
                        opacity: cashDecreaseSwitch.value ? 1 : 0.5,
                        child: Text(
                          "₹${cashDecreaseAmount.value}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Opacity(
                        opacity: cashDecreaseSwitch.value ? 1 : 0.5,
                        child: MaterialButton(
                          onPressed: cashDecreaseSwitch.value ? () => onIncreaseCashDecrease() : () {},
                          minWidth: 24,
                          height: 24,
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
                            size: 14,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      height: 25,
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Obx(
                          () => Switch(
                            value: singleWinSwitch.value,
                            onChanged: (value) => onSingleWinSwitchClick(),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            thumbColor: WidgetStatePropertyAll(singleWinSwitch.value ? context.theme.colorScheme.onSurface : context.theme.colorScheme.outline),
                            activeTrackColor: context.theme.colorScheme.surfaceContainerLow,
                            inactiveTrackColor: context.theme.colorScheme.secondaryContainer,
                            trackOutlineWidth: const WidgetStatePropertyAll(1),
                            trackOutlineColor: WidgetStatePropertyAll(context.theme.colorScheme.outline.withOpacity(0.5)),
                            splashRadius: 0,
                            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                            hoverColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Stop if single win exceeds",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Opacity(
                        opacity: singleWinSwitch.value ? 1 : 0.5,
                        child: MaterialButton(
                          onPressed: singleWinSwitch.value ? () => onDecreaseSingleWin() : () {},
                          minWidth: 24,
                          height: 24,
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
                            size: 14,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Opacity(
                        opacity: singleWinSwitch.value ? 1 : 0.5,
                        child: Text(
                          "₹${singleWinAmount.value}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Opacity(
                        opacity: singleWinSwitch.value ? 1 : 0.5,
                        child: MaterialButton(
                          onPressed: singleWinSwitch.value ? () => onIncreaseSingleWin() : () {},
                          minWidth: 24,
                          height: 24,
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
                            size: 14,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
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
      ),
    );
  }
}
