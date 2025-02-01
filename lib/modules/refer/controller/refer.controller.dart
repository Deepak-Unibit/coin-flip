import 'package:flip_coin/helper/urlLauncher.helper.dart';
import 'package:flip_coin/modules/referHistory/view/referHistory.view.dart';
import 'package:flip_coin/services/data.service.dart';
import 'package:flip_coin/utils/routes.util.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

import '../../../helper/snackBar.helper.dart';

class ReferController extends GetxController {
  DataService dataService = Get.find<DataService>();

  void onInvite() {
    String telegramLink =
        "https://t.me/share/url?url=https://t.me/Wheel24Bot?start=${dataService.profileData.referCode??""} %0A%0A🎁I've won ₹500 from this Game!🎁 %0AClick URL and play with me!%0A%0A💰Let's stike it rich together!💰";

    UrlLauncherHelper.launchLink(telegramLink);
  }

  void onCopyClick() {
    html.window.navigator.clipboard
        ?.writeText("https://t.me/Wheel24Bot?start=ReferralCode \n\n🎁I've won ₹500 from this Game!🎁 \nClick URL and play with me!\n\n💰Let's stike it rich together!💰")
        .then((_) {
      SnackBarHelper.show("Copied to Clipboard");
    }).catchError((e) {
      print("Failed to copy text to clipboard: $e");
    });
  }

  void onViewRefer() {
    RoutesUtil.to(()=>ReferHistoryView());
  }

  double truncateToDecimalPlaces(num value) {
    return (value * 100).truncateToDouble() / 100;
  }
}
