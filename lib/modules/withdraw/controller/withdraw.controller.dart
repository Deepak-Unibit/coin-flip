import 'package:flip_coin/modules/withdraw/components/addUPIBottomModalSheet.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  TextEditingController upiIdController = TextEditingController();

  void onWithdrawOptionClick(String name, String image) {
    upiIdController.clear();
    AddUPIBottomModalSheetComponent.show(
      upiIdController: upiIdController,
      upiName: name,
      image: image,
      onAddUPI: onAddUPI,
    );
  }

  void onAddUPI() {
    print("Add UPI");
  }
}
