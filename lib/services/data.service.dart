import 'package:flip_coin/api/call.api.dart';
import 'package:flip_coin/api/url.api.dart';
import 'package:flip_coin/models/coin.model.dart';
import 'package:flip_coin/models/profile.model.dart';
import 'package:flip_coin/models/settings.model.dart';
import 'package:get/get.dart';

class DataService extends GetxController {
  ProfileData profileData = ProfileData();
  Rx<CoinData> coinData = CoinData().obs;
  SettingsData settingsData = SettingsData();

  Future<void> getCoins() async {
    var resp = await ApiCall.get(UrlApi.getCoins);
    print(resp);
    CoinModel coinModel = CoinModel.fromJson(resp);
    if (coinModel.responseCode == 200) {
      coinData.value = coinModel.data ?? CoinData();
    }
  }

  Future<bool> getSettings() async {
    var resp = await ApiCall.get(UrlApi.getSettings);
    print(resp);
    SettingsModel settingsModel = SettingsModel.fromJson(resp);
    if (settingsModel.responseCode == 200) {
      settingsData = settingsModel.data ?? SettingsData();
      return true;
    }
    else {
      return false;
    }
  }
}
