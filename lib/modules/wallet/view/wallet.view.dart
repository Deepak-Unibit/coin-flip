import 'package:flip_coin/components/loadingPage/loadingPage.component.dart';
import 'package:flip_coin/components/primaryButton.component.dart';
import 'package:flip_coin/helper/date.helper.dart';
import 'package:flip_coin/modules/wallet/controller/wallet.controller.dart';
import 'package:flip_coin/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class WalletView extends StatelessWidget {
  WalletView({super.key});

  final WalletController walletController = WalletController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surfaceBright,
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              Row(
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
                    "My Wallet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  color: context.theme.colorScheme.primaryContainer.withOpacity(0.4),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetsUtil.getWalletAnimation(),
                      width: 35,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Wallet",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "₹${(walletController.dataService.profileData.value.winCoin ?? 0) + (walletController.dataService.profileData.value.gameCoin ?? 0)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    PrimaryButtonComponent(
                      onClick: () => walletController.onAddCoinClick(),
                      text: "ADD COIN",
                      fontSize: 13,
                      width: 80,
                      btnColor1: context.theme.colorScheme.surfaceContainerLow,
                      btnColor2: context.theme.colorScheme.surfaceContainerHigh,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: context.theme.colorScheme.surfaceContainer,
                  border: Border.all(color: context.theme.colorScheme.primary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetsUtil.getGameCoinAnimation(),
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Game Coin",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                "₹${walletController.dataService.profileData.value.gameCoin ?? 0}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.5,
                      height: 30,
                      color: context.theme.colorScheme.primary,
                    ),
                    SizedBox(
                      width: 130,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetsUtil.getWinCoinAnimation(),
                            height: 40,
                            width: 30,
                          ),
                          const SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Win Coin",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                "₹${walletController.dataService.profileData.value.winCoin ?? 0}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wallet History",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => walletController.onWalletHistoryFilterClick(),
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Image.asset(
                      AssetsUtil.getFilterIcon(),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ScrollShadow(
                  child: Obx(
                    () => LazyLoadScrollView(
                      onEndOfPage: () => walletController.onScrollEnd(),
                      child: RefreshIndicator(
                        onRefresh: () => walletController.onRefresh(),
                        displacement: 20,
                        child: ListView(
                          children: [
                            walletController.transactionDataList.isEmpty && !walletController.isLoading.value
                                ? Text(
                                    "No Wallet Data",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: context.theme.colorScheme.outline,
                                    ),
                                  )
                                : ListView.separated(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    shrinkWrap: true,
                                    primary: false,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: walletController.transactionDataList.length,
                                    separatorBuilder: (context, index) => Divider(
                                      height: 20,
                                      color: context.theme.colorScheme.primary,
                                    ),
                                    itemBuilder: (context, index) => Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                                            color: context.theme.colorScheme.primary,
                                          ),
                                          child: Image.asset(
                                            (walletController.transactionDataList[index].txnType ?? 0) == 2 ? AssetsUtil.getWithdrawIcon() : AssetsUtil.getDepositIcon(),
                                            height: 35,
                                            width: 35,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                walletController.transactionDataList[index].details ?? "",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: context.theme.colorScheme.onSurface,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          text: "ORDER ID: ",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w500,
                                                            color: context.theme.colorScheme.onSurface,
                                                          ),
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  "TX-${walletController.transactionDataList[index].id?.substring(walletController.transactionDataList[index].id!.length - 5) ?? "--"}",
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                color: context.theme.colorScheme.scrim,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        DateHelper().dateFormatNull(date: walletController.transactionDataList[index].createdAt ?? "", format: "dd MMM yyyy HH:mm a"),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w500,
                                                          color: context.theme.colorScheme.onSurface,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(top: 2, bottom: 2, left: 3, right: 5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                                                      gradient: LinearGradient(
                                                        begin: AlignmentDirectional.topStart,
                                                        end: AlignmentDirectional.bottomEnd,
                                                        colors: (walletController.transactionDataList[index].txnType ?? 0) == 2
                                                            ? [
                                                                context.theme.colorScheme.error,
                                                                context.theme.colorScheme.error,
                                                              ]
                                                            : [
                                                                context.theme.colorScheme.scrim,
                                                                context.theme.colorScheme.surfaceTint,
                                                              ],
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          AssetsUtil.getCoin(),
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                        const SizedBox(width: 2),
                                                        Text(
                                                          "${(walletController.transactionDataList[index].txnType ?? 0) == 2 ? "-" : "+"}${walletController.transactionDataList[index].amount ?? 0}",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500,
                                                            color: context.theme.colorScheme.onSurface,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    (walletController.transactionDataList[index].status ?? 0) == 1 ? "(Success)" : "(Failed)",
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w500,
                                                      color: (walletController.transactionDataList[index].status ?? 0) == 1 ? context.theme.colorScheme.scrim : context.theme.colorScheme.error,
                                                    ),
                                                  ),
                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: "${walletController.transactionDataList[index].coinType == 1 ? "Game Coin" : "Win Coin"}: ",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500,
                                                        color: context.theme.colorScheme.outline,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: "${walletController.transactionDataList[index].currentBalance ?? 0}",
                                                          style: TextStyle(
                                                            color: context.theme.colorScheme.onSurface,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Obx(
                              () => Visibility(
                                visible: walletController.isLoading.value,
                                child: LoadingPage.listLoading(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButtonComponent(
                      onClick: () => walletController.onWithdrawClick(),
                      text: "Withdraw Coin",
                      fontSize: 14,
                      btnColor1: context.theme.colorScheme.tertiary,
                      btnColor2: context.theme.colorScheme.tertiaryFixed,
                    ),
                    PrimaryButtonComponent(
                      onClick: () => walletController.onAddCoinClick(),
                      text: "Add Coin",
                      fontSize: 14,
                      btnColor1: context.theme.colorScheme.scrim,
                      btnColor2: context.theme.colorScheme.surfaceTint,
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
