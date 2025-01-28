import 'package:flip_coin/components/textField.component.dart';
import 'package:flip_coin/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/primaryButton.component.dart';

class AddCoinBottomModalSheetComponent {
  static show({
    required TextEditingController addCoinController,
    required List amountList,
    required Function onAmountClick,
  }) {
    return showModalBottomSheet(
      context: Get.context!,
      builder: (context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 450),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                  "Add Coin",
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
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 10),
                children: [
                  TextFieldComponent(
                    textEditingController: addCoinController,
                    hintText: "Add Coin",
                    textInputType: TextInputType.number,
                    maxLength: 8,
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    children: amountList
                        .map(
                          (amount) => PrimaryButtonComponent(
                            onClick: () => onAmountClick(amount),
                            width: 65,
                            height: 35,
                            text: "₹$amount",
                            fontSize: 15,
                            btnColor1: context.theme.colorScheme.secondaryContainer,
                            btnColor2: context.theme.colorScheme.secondaryContainer,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        size: 18,
                        color: context.theme.colorScheme.scrim,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "UPI",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        AssetsUtil.getUPIImage(),
                        width: 120,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButtonComponent(
              onClick: () {},
              text: "Add Coin",
              width: double.infinity,
              fontSize: 18,
              btnColor1: context.theme.colorScheme.tertiary,
              btnColor2: context.theme.colorScheme.tertiaryFixed,
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
