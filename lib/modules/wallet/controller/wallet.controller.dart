import 'package:flip_coin/api/call.api.dart';
import 'package:flip_coin/api/url.api.dart';
import 'package:flip_coin/models/transaction.model.dart';
import 'package:flip_coin/modules/wallet/components/addCoinBottomModalSheet.component.dart';
import 'package:flip_coin/modules/wallet/components/filterBottomModalSheet.component.dart';
import 'package:flip_coin/modules/withdraw/view/withdraw.view.dart';
import 'package:flip_coin/services/data.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/routes.util.dart';

class WalletController extends GetxController {
  DataService dataService = Get.find<DataService>();
  TextEditingController addCoinController = TextEditingController();
  RxList<TransactionData> transactionDataList = <TransactionData>[].obs;
  List<int> amountList = [100, 500, 1000];
  List<String> filterList = ["All", "Deposit", "Withdrawal", "Deposit and Withdrawal", "Game", "Admin", "Refer"];
  RxString selectedFilter = "All".obs;
  RxBool isLoading = false.obs;
  int currentPage = 1;
  int futurePage = 1;

  WalletController() {
    getTransactions();
  }

  void onScrollEnd() {
    if (futurePage > currentPage) {
      currentPage = futurePage;
      getTransactions();
    }
    return;
  }

  Future<void> onRefresh() async {
    currentPage = 1;
    futurePage = 1;
    transactionDataList.clear();
    getTransactions();
  }

  Future<void> getTransactions() async {
    isLoading.value = true;
    var resp = await ApiCall.get("${UrlApi.getTransaction}?page=$currentPage&limit=5");
    isLoading.value = false;

    TransactionModel transactionModel = TransactionModel.fromJson(resp);

    if (transactionModel.responseCode == 200) {
      transactionDataList.addAll(transactionModel.data ?? []);
      transactionDataList.refresh();
      futurePage++;
      print(transactionModel.data?.length);
    }
    return;
  }

  void onAddCoinClick() {
    addCoinController.text = "100";
    AddCoinBottomModalSheetComponent.show(
      addCoinController: addCoinController,
      amountList: amountList,
      onAmountClick: onAmountSelect,
    );
  }

  void onAmountSelect(int amount) {
    addCoinController.text = "$amount";
  }

  void onWalletHistoryFilterClick() {
    selectedFilter.value = "All";

    FilterBottomModalSheetComponent.show(
      filterList: filterList,
      selectedFilter: selectedFilter,
      onItemClick: onFilterItemClick,
      onApplyClick: onFilterApplyClick,
      onCancelClick: onFilterCancelClick,
    );
  }

  void onFilterItemClick(String item) {
    selectedFilter.value = item;
  }

  void onFilterApplyClick() {
    Get.back();
  }

  void onFilterCancelClick() {
    Get.back();
  }

  void onWithdrawClick() {
    RoutesUtil.to(() => WithdrawView());
  }
}
