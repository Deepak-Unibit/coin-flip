import 'package:get/get.dart';

class RoutesUtil {
  static to(Function page) => Get.to(page, transition: Transition.rightToLeftWithFade);
  static off(Function page) => Get.off(page, transition: Transition.rightToLeftWithFade);
  static offAll(Function page) => Get.offAll(page, transition: Transition.rightToLeftWithFade);
}