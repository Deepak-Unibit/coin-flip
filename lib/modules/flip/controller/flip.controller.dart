import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:get/get.dart';

class FlipController extends GetxController with GetTickerProviderStateMixin {
  Flutter3DController flutter3dController = Flutter3DController();
  Rxn<AnimationController> animationController = Rxn<AnimationController>();

  @override
  void onInit() {
    animationController.value = AnimationController(
      vsync: this,
      duration: 1000.milliseconds,
    );
    super.onInit();
  }

  @override
  void dispose() {
    animationController.value?.dispose();
    super.dispose();
  }

  int flag = 0;
  RxBool autoRotate = false.obs;
  void flipCard() async {
    autoRotate.value = !autoRotate.value;

    // if (flag == 0) {
    //   flag = 1;
    //   animationController.value?.forward();
    // }
    // else {
    //   flag = 0;
    //   animationController.value?.reverse();
    // }
  }
}
