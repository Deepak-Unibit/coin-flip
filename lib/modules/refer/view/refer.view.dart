import 'package:flip_coin/components/primaryButton.component.dart';
import 'package:flip_coin/utils/assets.util.dart';
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
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          AssetsUtil.getReferImage(),
                          height: 280,
                        ),
                        Container(
                          height: 120,
                          width: 250,
                          padding: const EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AssetsUtil.getReferCoupon(),
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Your Referral Code",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: context.theme.colorScheme.surfaceBright,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "XYZXYZ",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: context.theme.colorScheme.primaryFixed,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Tap to copy",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: context.theme.colorScheme.surfaceBright,
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
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Icon(
                                      Icons.copy,
                                      size: 14,
                                      color: context.theme.colorScheme.primaryFixed,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    PrimaryButtonComponent(
                      onClick: () {},
                      text: "Send Invite",
                      width: double.infinity,
                      btnColor1: context.theme.colorScheme.tertiary,
                      btnColor2: context.theme.colorScheme.tertiaryFixed,
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "1 Invite ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.onSurface,
                        ),
                        children: [
                          TextSpan(
                            text: "₹ 20",
                            style: TextStyle(
                              color: context.theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You and you friend will get bonuses",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Total Refer : ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: context.theme.colorScheme.onSurface,
                            ),
                            children: [
                              TextSpan(
                                text: "25",
                                style: TextStyle(
                                  color: context.theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        PrimaryButtonComponent(
                          onClick: () {},
                          text: "View",
                          width: 56,
                          height: 30,
                          fontSize: 14,
                          btnColor1: context.theme.colorScheme.tertiary,
                          btnColor2: context.theme.colorScheme.tertiaryFixed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 0,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Text(
                        "How it works?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
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
