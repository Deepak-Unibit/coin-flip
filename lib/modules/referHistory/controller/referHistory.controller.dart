import 'package:get/get.dart';

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';

class ReferHistoryController extends GetxController {
  RxList<int> gameHistoryDataList = <int>[].obs;
  RxBool isListLoading = false.obs;
  int currentPage = 1;
  int futurePage = 1;

  ReferHistoryController() {
    getReferHistory();
  }

  void onScrollEnd() {
    if (futurePage > currentPage) {
      currentPage = futurePage;
      getReferHistory();
    }
    return;
  }

  Future<void> getReferHistory() async {
    String url = "${UrlApi.getGameHistory}?page=$currentPage&limit=20";

    isListLoading.value = true;
    var resp = await ApiCall.get(url);
    isListLoading.value = false;
    print(url);

    // GameHistoryModel gameHistoryModel = GameHistoryModel.fromJson(resp);
    //
    // if (gameHistoryModel.responseCode == 200) {
    //   gameHistoryDataList.addAll(gameHistoryModel.data ?? []);
    //   gameHistoryDataList.refresh();
    //   futurePage++;
    // }
    return;
  }

  double truncateToDecimalPlaces(num value) {
    return (value * 100).truncateToDouble() / 100;
  }
}
