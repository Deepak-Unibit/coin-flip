import 'package:flip_coin/helper/date.helper.dart';
import 'package:flip_coin/modules/gameHistory/controller/gameHistory.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../components/loadingPage/loadingPage.component.dart';
import '../../../utils/assets.util.dart';

class GameHistoryView extends StatelessWidget {
  GameHistoryView({super.key});

  final GameHistoryController gameHistoryController = GameHistoryController();

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
                    "Game History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () => gameHistoryController.onFilterClick(),
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
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: context.theme.colorScheme.surfaceContainer,
                  border: Border.all(color: context.theme.colorScheme.primary),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 45,
                      child: Text(
                        "Choose",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Bet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Win",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 130,
                      child: Text(
                        "Time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ScrollShadow(
                  child: Obx(
                    () => LazyLoadScrollView(
                      onEndOfPage: () => gameHistoryController.onScrollEnd(),
                      child: ListView(
                        children: [
                          gameHistoryController.gameHistoryDataList.isEmpty && !gameHistoryController.isListLoading.value
                              ? Text(
                                  "No Game History",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: context.theme.colorScheme.outline,
                                  ),
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.all(5),
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: gameHistoryController.gameHistoryDataList.length,
                                  separatorBuilder: (context, index) => Divider(
                                    height: 20,
                                    color: context.theme.colorScheme.primary,
                                  ),
                                  itemBuilder: (context, index) => Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 45,
                                        child: Text(
                                          gameHistoryController.gameHistoryDataList[index].chooseOption == "H" ? "Head" : "Tail",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: context.theme.colorScheme.onSurface,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "₹${gameHistoryController.truncateToDecimalPlaces(gameHistoryController.gameHistoryDataList[index].joinAmount ?? 0)}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.onSurface,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "₹${gameHistoryController.truncateToDecimalPlaces(gameHistoryController.gameHistoryDataList[index].winAmount ?? 0)}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: gameHistoryController.gameHistoryDataList[index].isWin??false ?context.theme.colorScheme.scrim : context.theme.colorScheme.onSurface,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          DateHelper().dateFormatNull(date: gameHistoryController.gameHistoryDataList[index].createdAt ?? "", format: "dd MMM yyyy hh:mm a"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: context.theme.colorScheme.onSurface,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          Obx(
                            () => Visibility(
                              visible: gameHistoryController.isListLoading.value,
                              child: LoadingPage.listLoading(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
