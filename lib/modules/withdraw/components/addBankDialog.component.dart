import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get/get.dart';
import '../../../components/primaryButton.component.dart';
import '../../../components/textField.component.dart';

class AddBankDialogComponent {
  static show({
    required TextEditingController accountHolderNameController,
    required TextEditingController accountNumberController,
    required TextEditingController confirmAccountNumberController,
    required TextEditingController ifscCodeController,
    required Function onAddBankClick,
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
            constraints: const BoxConstraints(
              maxWidth: 450,
              maxHeight: 450,
            ),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      "Add Bank Account",
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
                const SizedBox(height: 10),
                Expanded(
                  child: ScrollShadow(
                    child: ListView(
                      children: [
                        // ----------Account Holder Name----------
                        Text(
                          "A/C Holder Name".tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFieldComponent(
                          textEditingController: accountHolderNameController,
                          hintText: "Enter account holder name",
                          textInputType: TextInputType.name,
                          maxLength: 200,
                          prefixIcon: Icons.person_outline,
                        ),

                        // ----------Account Number----------
                        const SizedBox(height: 8),
                        Text(
                          "A/C Number".tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFieldComponent(
                          textEditingController: accountNumberController,
                          hintText: "Enter account number",
                          textInputType: TextInputType.text,
                          maxLength: 150,
                          prefixIcon: Icons.account_balance_outlined,
                        ),

                        // ----------Confirm Account Number----------
                        const SizedBox(height: 8),
                        Text(
                          "Confirm account number".tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFieldComponent(
                          textEditingController: confirmAccountNumberController,
                          hintText: "Confirm account number",
                          textInputType: TextInputType.text,
                          maxLength: 150,
                          prefixIcon: Icons.account_balance_outlined,
                        ),

                        // ----------IFSC Code----------
                        const SizedBox(height: 8),
                        Text(
                          "IFSC Code".tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFieldComponent(
                          textEditingController: ifscCodeController,
                          hintText: "Enter IFSC",
                          textInputType: TextInputType.text,
                          maxLength: 150,
                          prefixIcon: Icons.location_city_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                PrimaryButtonComponent(
                  onClick: () => onAddBankClick(),
                  text: "Add Bank",
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
