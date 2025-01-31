import 'package:flip_coin/api/call.api.dart';
import 'dart:html' as html;
import 'package:flip_coin/api/url.api.dart';
import 'package:flip_coin/components/loadingPage/loadingPage.component.dart';
import 'package:flip_coin/helper/regex.helper.dart';
import 'package:flip_coin/helper/snackBar.helper.dart';
import 'package:flip_coin/models/response.model.dart';
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
  RxInt selectedFilter = 100.obs;
  RxBool isListLoading = false.obs;
  int currentPage = 1;
  int futurePage = 1;
  double gameCoinTemp = 0;
  double winCoinTemp = 0;

  WalletController() {
    getTransactions();
    gameCoinTemp = (dataService.coinData.value.gameCoin ?? 0.0) as double;
    winCoinTemp = (dataService.coinData.value.winCoin ?? 0.0) as double;
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
    isFirstGameCoinDone = false;
    isFirstWinCoinDone = false;
    gameCoinTemp = (dataService.coinData.value.gameCoin ?? 0.0) as double;
    winCoinTemp = (dataService.coinData.value.winCoin ?? 0.0) as double;
    getTransactions();
  }

  Future<void> getTransactions() async {
    isListLoading.value = true;
    var resp = await ApiCall.get("${UrlApi.getTransaction}?page=$currentPage&limit=10");
    isListLoading.value = false;

    TransactionModel transactionModel = TransactionModel.fromJson(resp);

    if (transactionModel.responseCode == 200) {
      transactionDataList.addAll(calculateCoinBalance(transactionModel.data ?? []));
      transactionDataList.refresh();
      futurePage++;
    }
    return;
  }

  bool isFirstGameCoinDone = false;
  bool isFirstWinCoinDone = false;
  List<TransactionData> calculateCoinBalance(List<TransactionData> dataList) {
    List<TransactionData> transactionDataList = dataList;
    for (int i = 0; i < transactionDataList.length; i++) {
      // Failed Transaction
      if (transactionDataList[i].status != 1) {
        transactionDataList[i].setCurrentBalance = gameCoinTemp;
        continue;
      }

      if (transactionDataList[i].coinType == 1) {
        if (!isFirstGameCoinDone) {
          transactionDataList[i].setCurrentBalance = gameCoinTemp;
          isFirstGameCoinDone = true;
        } else {
          if (transactionDataList[i].txnType == 1) {
            gameCoinTemp += (transactionDataList[i].amount ?? 0);
            transactionDataList[i].setCurrentBalance = gameCoinTemp;
          } else {
            gameCoinTemp -= (transactionDataList[i].amount ?? 0);
            transactionDataList[i].setCurrentBalance = gameCoinTemp;
          }
        }
      } else if (transactionDataList[i].coinType == 2) {
        if (!isFirstWinCoinDone) {
          transactionDataList[i].setCurrentBalance = winCoinTemp;
          isFirstWinCoinDone = true;
        } else {
          if (transactionDataList[i].txnType == 1) {
            winCoinTemp += (transactionDataList[i].amount ?? 0);
            transactionDataList[i].setCurrentBalance = winCoinTemp;
          } else {
            winCoinTemp -= (transactionDataList[i].amount ?? 0);
            transactionDataList[i].setCurrentBalance = winCoinTemp;
          }
        }
      }
    }
    return transactionDataList;
  }

  void onAddCoinClick() {
    addCoinController.text = "100";
    AddCoinBottomModalSheetComponent.show(
      addCoinController: addCoinController,
      amountList: amountList,
      onAmountClick: onAmountSelect,
      onAddCoin: onAddCoin, 
    );
  }

  void onAmountSelect(int amount) {
    addCoinController.text = "$amount";
  }
  
  Future<void> onAddCoin() async {
    addCoinController.text = addCoinController.text.trim();
    
    if(!RegexHelper.amountRegex.hasMatch(addCoinController.text)) {
      SnackBarHelper.show("Please select a valid amount");
      return;
    }
    
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.depositCoin}/${addCoinController.text}");
    LoadingPage.close();
    print(resp);

    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if(responseModel.responseCode == 200) {
      Get.back();
      html.window.open(responseModel.data, '_blank');
    }
    else {
      SnackBarHelper.show(responseModel.message);
    }
  }

  void onWalletHistoryFilterClick() {

    FilterBottomModalSheetComponent.show(
      filterList: filterList,
      selectedFilter: selectedFilter,
      onItemClick: onFilterItemClick,
      onApplyClick: onFilterApplyClick,
      onClearClick: onFilterCancelClick,
    );
  }

  void onFilterItemClick(int val) {
    selectedFilter.value = val;
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

  double truncateToDecimalPlaces(num value) {
    return (value * 100).truncateToDouble() / 100;
  }
}
