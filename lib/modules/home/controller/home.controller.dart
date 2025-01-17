import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  RxInt coinStatus = 0.obs; // 0 - Head | 1 - Tail | 2 - Rotating

  onFlip() {
    if (coinStatus.value != 2) {
      coinStatus.value = 2;
      Future.delayed(
        2.seconds,
        () {
          coinStatus.value = 1;
        },
      );
    }
    return;
  }

  final Rxn<AnimationController> _controller = Rxn<AnimationController>();
  AnimationController? get controller => _controller.value;
  late Animation animation;
  AnimationStatus status = AnimationStatus.dismissed;
  RxInt resultCoin = 0.obs;
  RxBool showConfetti = false.obs;

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

  RxInt selectedType = 0.obs;
  void onSelectType(int value) {
    selectedType.value = value;
  }

  bool isFlipping = false;
  void onFlipCoin() {
    if(isFlipping) {
      return;
    }
    _controller.value = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
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
            Future.delayed(4.seconds, () {
              showConfetti.value = false;
              isFlipping = false;
            });
          }
        },
      );
    _controller.value?.reset();
    _controller.value?.forward();

    isFlipping = true;

    resultCoin.value = selectedType.value;

    Future.delayed(1500.milliseconds, () {
      resultCoin.value = resultCoin.value == 0 ? 1 : 0;
      print("1 ${resultCoin.value}");
      Future.delayed(1200.milliseconds, () {
        resultCoin.value = resultCoin.value == 0 ? 1 : 0;
        print("2 ${resultCoin.value}");
      });
    });
  }
}
