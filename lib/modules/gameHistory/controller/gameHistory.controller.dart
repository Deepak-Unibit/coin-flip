import 'package:flip_coin/models/gameHistory.model.dart';
import 'package:get/get.dart';

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';
import '../../wallet/components/filterBottomModalSheet.component.dart';

class GameHistoryController extends GetxController {
  RxList<GameHistoryData> gameHistoryDataList = <GameHistoryData>[].obs;
  RxBool isListLoading = false.obs;
  int currentPage = 1;
  int futurePage = 1;
  List<String> filterList = ["Win", "Loss"];
  RxInt selectedFilter = 100.obs;

  GameHistoryController() {
    getGameHistory();
  }

  void onScrollEnd() {
    if (futurePage > currentPage) {
      currentPage = futurePage;
      getGameHistory();
    }
    return;
  }

  Future<void> getGameHistory() async {
    String url = "${UrlApi.getGameHistory}?page=$currentPage&limit=20";

    if (selectedFilter.value != 100) {
      url += "&filterByResult=${selectedFilter.value}";
    }

    isListLoading.value = true;
    var resp = await ApiCall.get(url);
    isListLoading.value = false;
    print(url);

    GameHistoryModel gameHistoryModel = GameHistoryModel.fromJson(resp);

    if (gameHistoryModel.responseCode == 200) {
      gameHistoryDataList.addAll(gameHistoryModel.data ?? []);
      gameHistoryDataList.refresh();
      futurePage++;
    }
    return;
  }

  void onFilterClick() {
    FilterBottomModalSheetComponent.show(
      filterList: filterList,
      selectedFilter: selectedFilter,
      onItemClick: onFilterItemClick,
      onApplyClick: onFilterApplyClick,
      onClearClick: onFilterClearClick,
    );
  }

  void onFilterItemClick(int val) {
    if(selectedFilter.value == val) {
      selectedFilter.value = 100;
      return;
    }
    selectedFilter.value = val;
    return;
  }

  void onFilterApplyClick() {
    Get.back();
    currentPage = 1;
    futurePage = 1;
    gameHistoryDataList.clear();
    getGameHistory();
  }

  void onFilterClearClick() {
    Get.back();
    selectedFilter.value = 100;
    currentPage = 1;
    futurePage = 1;
    gameHistoryDataList.clear();
    getGameHistory();
  }

  double truncateToDecimalPlaces(num value) {
    return (value * 100).truncateToDouble() / 100;
  }
}
