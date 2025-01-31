import 'package:flip_coin/api/call.api.dart';
import 'package:flip_coin/api/url.api.dart';
import 'package:flip_coin/models/coin.model.dart';
import 'package:flip_coin/models/profile.model.dart';
import 'package:get/get.dart';

class DataService extends GetxController {
  ProfileData profileData = ProfileData();
  Rx<CoinData> coinData = CoinData().obs;

  Future<void> getCoins() async {
    var resp = await ApiCall.get(UrlApi.getCoins);
    print(resp);
    CoinModel coinModel = CoinModel.fromJson(resp);
    if(coinModel.responseCode == 200) {
      coinData.value = coinModel.data??CoinData();
    }
  }

}