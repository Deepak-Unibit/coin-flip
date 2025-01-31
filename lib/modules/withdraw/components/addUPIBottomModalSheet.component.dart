import 'package:flip_coin/components/textField.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/primaryButton.component.dart';

class AddUPIBottomModalSheetComponent {
  static show({
    required TextEditingController upiIdController,
    required String upiName,
    required String image,
    required Function onAddUPI,
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
                  "Add $upiName Details",
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
                  Image.asset(
                    image,
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "UPI Id",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldComponent(
                    textEditingController: upiIdController,
                    hintText: "Enter ${upiName=="UPI" ? "" : "$upiName "}UPI Id",
                    textInputType: TextInputType.text,
                    maxLength: 100,
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
