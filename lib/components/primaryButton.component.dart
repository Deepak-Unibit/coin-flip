import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButtonComponent extends StatelessWidget {
  const PrimaryButtonComponent({
    super.key,
    required this.onClick,
    this.text,
    this.image,
    this.btnColor1,
    this.btnColor2,
    this.borderRadius = 10,
    this.height = 40,
    this.width = 120,
    this.fontSize = 16,
    this.imageSize = 30,
    this.gap = 5,
  });

  final Function onClick;
  final String? text;
  final String? image;
  final Color? btnColor1;
  final Color? btnColor2;
  final double borderRadius;
  final double height;
  final double width;
  final double fontSize;
  final double imageSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClick(),
      minWidth: 0,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(color: context.theme.colorScheme.outline.withOpacity(0.5)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              btnColor1 ?? context.theme.colorScheme.secondary,
              btnColor2 ?? context.theme.colorScheme.secondaryFixed,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            image != null
                ? Image.asset(
                    image ?? "",
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.contain,
                  )
                : const SizedBox.shrink(),
            SizedBox(width: image != null ? gap : 0),
            text != null
                ? Text(
                    text ?? "",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
