import 'dart:convert';

import 'package:flip_coin/helper/snackBar.helper.dart';
import 'package:flip_coin/models/profile.model.dart';
import 'package:flip_coin/modules/home/components/autoPlayDialog.component.dart';
import 'package:flip_coin/modules/home/components/resultDialog.component.dart';
import 'package:flip_coin/modules/wallet/view/wallet.view.dart';
import 'package:flip_coin/services/data.service.dart';
import 'package:flip_coin/utils/routes.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';
import '../../../components/loadingPage/loadingPage.component.dart';
import '../../../models/user.model.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  DataService dataService = Get.find<DataService>();
  Rx<ProfileData> profileData = ProfileData().obs;

  // Animation
  final Rxn<AnimationController> _controller = Rxn<AnimationController>();
  AnimationController? get controller => _controller.value;
  late Animation animation;
  AnimationStatus status = AnimationStatus.dismissed;
  RxInt resultCoin = 0.obs;
  RxBool showConfetti = false.obs;

  // Others
  TextEditingController amountController = TextEditingController(text: "10");
  RxInt selectedType = 0.obs;
  List<int> amountList = [50, 100, 200, 500, 1000];
  RxInt selectedAmount = 50.obs;
  List<int> roundList = [10, 100, 500, 1000, 5000, 10000];
  RxInt selectedRound = 10.obs;
  RxBool cashDecreaseSwitch = false.obs;
  RxBool singleWinSwitch = false.obs;
  RxInt cashDecreaseAmount = 0.obs;
  RxInt singleWinAmount = 0.obs;

  @override
  void onInit() {
    _controller.value = AnimationController(vsync: this, duration: const Duration(milliseconds: 0));
    animation = Tween(end: 0.0, begin: 0.0).animate(_controller.value as Animation<double>);

    try {
      // Production
      // var state = js.JsObject.fromBrowserObject(js.context['state']);
      // Map<String, dynamic> userData = jsonDecode(state['userData']);
      // UserModel userModel = UserModel.fromJson(userData);
      //
      // print(userData);
      // if (userModel.id != null) {
      //   Future.delayed(200.milliseconds, () => login(userModel.id ?? 0));
      // }

      // Development
      Future.delayed(200.milliseconds, () => login(12));
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> login(num telegramId) async {
    // Production
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.login}/$telegramId");
    LoadingPage.close();

    print(resp);

    ProfileModel profileModel = ProfileModel.fromJson(resp);

    if (profileModel.responseCode == 200) {
      profileData.value = profileModel.data ?? ProfileData();
      dataService.profileData.value = profileModel.data ?? ProfileData();
    } else {
      SnackBarHelper.show(profileModel.message);
    }
    return;
  }

  void onWalletClick() {
    RoutesUtil.to(() => WalletView());
  }

  void decreaseAmount() {
    if (selectedAmount.value <= 10) {
      return;
    }
    selectedAmount.value = selectedAmount.value - 10;
    amountController.text = "${selectedAmount.value}";
  }

  void increaseAmount() {
    if (selectedAmount.value >= 1000) {
      return;
    }
    selectedAmount.value = selectedAmount.value + 10;
    amountController.text = "${selectedAmount.value}";
  }

  void onAmountSelect(int amount) {
    selectedAmount.value = amount;
    amountController.text = "${selectedAmount.value}";
  }

  void onSelectCoinType(int value) {
    selectedType.value = value;
  }

  RxBool isFlipping = false.obs;
  RxBool showLottie = true.obs;
  void onFlipCoin() {
    if (isFlipping.value) {
      return;
    }
    _controller.value = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween(end: selectedType.value == 0 ? 18.0 : 19.0, begin: 0.0).animate(
      CurvedAnimation(parent: _controller.value!, curve: Curves.easeInOut),
    )
      ..addListener(
        () {},
      )
      ..addStatusListener(
        (status) {
          this.status = status;
          if (status == AnimationStatus.completed) {
            _controller.value?.stop();
            ResultDialogComponent.show(
              amount: 10,
              coinType: selectedType.value,
              isWin: selectedType.value == 0,
            );
            Future.delayed(500.milliseconds, () {
              showLottie.value = true;
              isFlipping.value = false;
            });
          }
        },
      );
    _controller.value?.reset();
    _controller.value?.forward();

    isFlipping.value = true;
    showLottie.value = false;

    resultCoin.value = selectedType.value;
  }

  // Autoplay
  void onAutoPlayClick() {
    selectedRound.value = 10;
    cashDecreaseSwitch.value = false;
    singleWinSwitch.value = false;
    cashDecreaseAmount.value = 0;
    singleWinAmount.value = 0;

    AutoPlayDialogComponent.show(
      roundList: roundList,
      selectedType: selectedType,
      selectedRound: selectedRound,
      cashDecreaseAmount: cashDecreaseAmount,
      singleWinAmount: singleWinAmount,
      cashDecreaseSwitch: cashDecreaseSwitch,
      singleWinSwitch: singleWinSwitch,
      onSelectCoinType: onSelectCoinType,
      onSelectRound: onAutoPlayRoundClick,
      onCashDecreaseSwitchClick: onCashDecreaseSwitchClick,
      onSingleWinSwitchClick: onSingleWinSwitchClick,
      onDecreaseCashDecrease: decreaseCashDecreaseAmount,
      onIncreaseCashDecrease: increaseCashDecreaseAmount,
      onDecreaseSingleWin: decreaseSingleWinAmount,
      onIncreaseSingleWin: increaseSingleWinAmount,
    );
  }

  void onAutoPlayRoundClick(int round) {
    selectedRound.value = round;
  }

  void onCashDecreaseSwitchClick() {
    cashDecreaseSwitch.value = !cashDecreaseSwitch.value;
  }

  void onSingleWinSwitchClick() {
    singleWinSwitch.value = !singleWinSwitch.value;
  }

  void decreaseCashDecreaseAmount() {
    if (cashDecreaseAmount.value <= 0) {
      return;
    }
    cashDecreaseAmount.value = cashDecreaseAmount.value - 10;
  }

  void increaseCashDecreaseAmount() {
    // if (cashDecreaseAmount.value >= 1000) {
    //   return;
    // }
    cashDecreaseAmount.value = cashDecreaseAmount.value + 10;
  }

  void decreaseSingleWinAmount() {
    if (singleWinAmount.value <= 0) {
      return;
    }
    singleWinAmount.value = singleWinAmount.value - 10;
  }

  void increaseSingleWinAmount() {
    // if (cashDecreaseAmount.value >= 1000) {
    //   return;
    // }
    singleWinAmount.value = singleWinAmount.value + 10;
  }
}
