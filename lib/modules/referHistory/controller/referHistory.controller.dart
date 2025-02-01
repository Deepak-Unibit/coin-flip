import 'package:flip_coin/models/refer.model.dart';
import 'package:get/get.dart';

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';

class ReferHistoryController extends GetxController {
  RxList<ReferData> referDataList = <ReferData>[].obs;
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
    String url = "${UrlApi.getReferHistory}?page=$currentPage&limit=20";

    isListLoading.value = true;
    var resp = await ApiCall.get(url);
    isListLoading.value = false;
    print(url);

    ReferModel referModel = ReferModel.fromJson(resp);

    if (referModel.responseCode == 200) {
      referDataList.addAll(referModel.data ?? []);
      referDataList.refresh();
      futurePage++;
    }
    return;
  }

  double truncateToDecimalPlaces(num value) {
    return (value * 100).truncateToDouble() / 100;
  }
}
