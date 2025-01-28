import 'package:flip_coin/modules/wallet/components/addCoinBottomModalSheet.component.dart';
import 'package:flip_coin/modules/wallet/components/filterBottomModalSheet.component.dart';
import 'package:flip_coin/modules/withdraw/view/withdraw.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  TextEditingController addCoinController = TextEditingController();
  List<int> amountList = [100, 500, 1000];
  List<String> filterList = ["All", "Deposit", "Withdrawal", "Deposit and Withdrawal", "Game", "Admin", "Refer"];
  RxString selectedFilter = "All".obs;

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
    Get.to(()=>WithdrawView());
  }
}
