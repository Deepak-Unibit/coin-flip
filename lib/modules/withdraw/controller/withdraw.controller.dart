import 'package:flip_coin/models/bankAccount.model.dart';
import 'package:flip_coin/models/response.model.dart';
import 'package:flip_coin/modules/withdraw/components/addBankDialog.component.dart';
import 'package:flip_coin/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api/call.api.dart';
import '../../../api/url.api.dart';
import '../../../components/loadingPage/loadingPage.component.dart';
import '../../../helper/regex.helper.dart';
import '../../../helper/snackBar.helper.dart';

class WithdrawController extends GetxController {
  DataService dataService = Get.find<DataService>();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController confirmAccountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  RxList<BankAccountData> bankAccountDataList = <BankAccountData>[].obs;
  RxBool isLoading = false.obs;
  RxString selectedAccount = "".obs;

  WithdrawController() {
    getBankAccountData();
  }

  Future<void> getBankAccountData() async {
    isLoading.value = true;
    var resp = await ApiCall.get(UrlApi.getAccountList);
    isLoading.value = false;

    BankAccountModel bankAccountModel = BankAccountModel.fromJson(resp);

    if (bankAccountModel.responseCode == 200) {
      bankAccountDataList.clear();
      bankAccountDataList.addAll(bankAccountModel.data ?? []);
      bankAccountDataList.refresh();
    }
  }

  void onWithdrawOptionClick() {
    accountHolderNameController.clear();
    accountNumberController.clear();
    confirmAccountNumberController.clear();
    ifscCodeController.clear();
    AddBankDialogComponent.show(
      accountHolderNameController: accountHolderNameController,
      accountNumberController: accountNumberController,
      confirmAccountNumberController: confirmAccountNumberController,
      ifscCodeController: ifscCodeController,
      onAddBankClick: onAddBankClick,
    );
  }

  Future<void> onAddBankClick() async {
    accountHolderNameController.text = accountHolderNameController.text.trim();
    accountNumberController.text = accountNumberController.text.trim();
    confirmAccountNumberController.text = confirmAccountNumberController.text.trim();
    ifscCodeController.text = ifscCodeController.text.trim();

    if (accountNumberController.text != confirmAccountNumberController.text) {
      SnackBarHelper.show("Account number and Confirm account number are not same");
      return;
    }

    if (!RegexHelper.nameRegex.hasMatch(accountHolderNameController.text)) {
      SnackBarHelper.show("Enter a valid account holder name");
      return;
    }
    if (!RegexHelper.bankAccountNumberRegex.hasMatch(accountNumberController.text)) {
      SnackBarHelper.show("Enter a valid bank account number");
      return;
    }
    if (!RegexHelper.ifscCodeRegex.hasMatch(ifscCodeController.text)) {
      SnackBarHelper.show("Enter a valid IFSC Code");
      return;
    }

    Map<String, dynamic> data = {
      "accountHolderName": accountHolderNameController.text,
      "accountNumber": accountNumberController.text,
      "ifscCode": ifscCodeController.text,
    };

    LoadingPage.show();
    var resp = await ApiCall.post(UrlApi.addBankAccount, data);
    LoadingPage.close();

    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if (responseModel.responseCode == 200) {
      Get.back();
      SnackBarHelper.show(responseModel.message);
      getBankAccountData();
    } else {
      SnackBarHelper.show(responseModel.message);
    }
  }

  void selectBankAccount(String id) {
    selectedAccount.value = id;
  }

  Future<void> withdrawCoin() async {
    amountController.text = amountController.text.trim();
    if (!RegexHelper.amountRegex.hasMatch(amountController.text)) {
      SnackBarHelper.show("Please select a valid amount");
      return;
    }

    if (selectedAccount.value == "") {
      if (bankAccountDataList.isEmpty) {
        SnackBarHelper.show("Please add an account");
        return;
      } else {
        SnackBarHelper.show("Please select an account");
        return;
      }
    }

    if (int.parse(amountController.text) < 500) {
      SnackBarHelper.show("Minimum withdraw amount is 500");
      return;
    }

    if (int.parse(amountController.text) > 50000) {
      SnackBarHelper.show("Maximum withdraw amount is 50000");
      return;
    }

    if (int.parse(amountController.text) > (dataService.coinData.value.winCoin??0)) {
      SnackBarHelper.show("Withdraw amount is more than win coin.");
      return;
    }

    Map<String, dynamic> data = {
      "accountId": selectedAccount.value,
      "amount": amountController.text,
    };

    LoadingPage.show();
    var resp = await ApiCall.post(UrlApi.withdrawCoin, data);
    LoadingPage.close();

    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if (responseModel.responseCode == 200) {
      SnackBarHelper.show(responseModel.message);
      dataService.getCoins();
    } else {
      SnackBarHelper.show(responseModel.message);
    }
    return;
  }

  double truncateToDecimalPlaces(num value) {
    return (value * 100).truncateToDouble() / 100;
  }
}
