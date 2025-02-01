import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferView extends StatelessWidget {
  const ReferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surfaceBright,
      body: Center(
        child: Container(
          width: double.infinity,
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
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Navigator.canPop(context)
                        ? MaterialButton(
                            onPressed: () => Get.back(),
                            minWidth: 0,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(width: 10),
                    Text(
                      "Refer and Earn",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Refer & Earn\nUnlimited ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.onSurface,
                        ),
                        children: [
                          TextSpan(
                            text: "Money",
                            style: TextStyle(
                              color: context.theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
