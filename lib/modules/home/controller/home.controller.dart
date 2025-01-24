import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  // Animation
  final Rxn<AnimationController> _controller = Rxn<AnimationController>();
  AnimationController? get controller => _controller.value;
  late Animation animation;
  AnimationStatus status = AnimationStatus.dismissed;
  RxInt resultCoin = 0.obs;
  RxBool showConfetti = false.obs;
  int totalAmount = 0;

  // Others
  TextEditingController amountController = TextEditingController(text: "10");
  RxInt selectedType = 0.obs;
  List<int> amountList = [50, 100, 200, 500, 1000];
  RxInt selectedAmount = 50.obs;

  @override
  void onInit() {
    _controller.value = AnimationController(vsync: this, duration: const Duration(milliseconds: 0));
    animation = Tween(end: 30.0, begin: 0.0).animate(_controller.value as Animation<double>)
      ..addListener(
        () {},
      )
      ..addStatusListener(
        (status) {
          this.status = status;
          if (status == AnimationStatus.completed) {
            _controller.value?.stop(); // Stop after completing 5 rotations
            showConfetti.value = true;
            Future.delayed(
              4.seconds,
              () => showConfetti.value = false,
            );
          }
        },
      );

    super.onInit();
  }

  void onSelectType(int value) {
    selectedType.value = value;
  }

  void decreaseAmount() {
    if(selectedAmount.value <= 10) {
      return;
    }
    selectedAmount.value = selectedAmount.value - 10;
  }

  void increaseAmount() {
    if(selectedAmount.value >= 1000) {
      return;
    }
    selectedAmount.value = selectedAmount.value + 10;
  }

  void onAmountSelect(int amount) {
    selectedAmount.value = amount;
  }

  RxBool isFlipping = false.obs;
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
            showConfetti.value = true;
            Future.delayed(3.5.seconds, () {
              showConfetti.value = false;
              isFlipping.value = false;
            });
          }
        },
      );
    _controller.value?.reset();
    _controller.value?.forward();

    isFlipping.value = true;

    resultCoin.value = selectedType.value;

    // Future.delayed(800.milliseconds, () {
    //   resultCoin.value = resultCoin.value == 0 ? 1 : 0;
    //   Future.delayed(500.milliseconds, () {
    //     resultCoin.value = resultCoin.value == 0 ? 1 : 0;
    //   });
    // });
  }
}
