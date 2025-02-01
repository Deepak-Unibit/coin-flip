import 'package:flip_coin/components/primaryButton.component.dart';
import 'package:flip_coin/modules/refer/controller/refer.controller.dart';
import 'package:flip_coin/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferView extends StatelessWidget {
  ReferView({super.key});

  final ReferController referController = ReferController();

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
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Your total earnings",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "₹ ${referController.truncateToDecimalPlaces(referController.dataService.profileData.referEarn ?? 0)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                      ],
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
                      children: [
                        Image.asset(AssetsUtil.getShiningStart()),
                        Image.asset(AssetsUtil.getReferAnimation()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: PrimaryButtonComponent(
                            onClick: () => referController.onInvite(),
                            text: "Send Invite",
                            width: double.infinity,
                            btnColor1: context.theme.colorScheme.tertiary,
                            btnColor2: context.theme.colorScheme.tertiaryFixed,
                          ),
                        ),
                        const SizedBox(width: 10),
                        MaterialButton(
                          onPressed: () => referController.onCopyClick(),
                          minWidth: 0,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          elevation: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  context.theme.colorScheme.tertiary,
                                  context.theme.colorScheme.tertiaryFixed,
                                ],
                              ),
                              border: Border.all(color: context.theme.colorScheme.outline.withOpacity(0.5)),
                            ),
                            child: Icon(
                              Icons.copy,
                              size: 18,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
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
                            text: "₹ ${referController.dataService.settingsData.signupReferBonus??0}",
                            style: TextStyle(
                              color: context.theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Invite friends",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
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
                                text: "${referController.dataService.profileData.referCount ?? 0}",
                                style: TextStyle(
                                  color: context.theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        PrimaryButtonComponent(
                          onClick: () => referController.onViewRefer(),
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
                    Tooltip(
                      message: "https://t.me/Wheel24Bot?start=ReferralCode I've won ₹500 from this Game!🎁 \nClick URL and play with me!💰Let's stike it rich together!💰",
                      triggerMode: TooltipTriggerMode.tap,
                      showDuration: 15.seconds,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), color: context.theme.colorScheme.surfaceContainer.withOpacity(0.85)),
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
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        40,
                        (index) => Container(
                          color: index % 2 == 0 ? Colors.transparent : context.theme.colorScheme.outline.withOpacity(0.5),
                          height: 1,
                          width: 3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
