import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.textEditingController,
    this.hintText = "Enter Amount",
    this.isBorder = false,
    required this.textInputType,
    required this.maxLength,
    this.maxLines = 1,
    this.height = 50,
    this.textInputAction,
    this.enabled = true,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final bool isBorder;
  final TextInputType textInputType;
  final int maxLength;
  final int maxLines;
  final double height;
  final TextInputAction? textInputAction;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: textEditingController,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        enabled: enabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.theme.colorScheme.primaryContainer,
          counterText: "",
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onSurface.withOpacity(0.5),
          ),
          alignLabelWithHint: true,
          labelText: hintText,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onSurface.withOpacity(0.75),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          prefixIcon: Icon(
            Icons.currency_rupee_rounded,
            size: 18,
            color: context.theme.colorScheme.onSurface.withOpacity(0.75),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: context.theme.colorScheme.outline.withOpacity(0.5),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: context.theme.colorScheme.outline.withOpacity(0.75),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
