import 'app.const.dart';

class UrlApi {
  static const String baseUrl = AppConst.baseUrl;

  // Auth
  static const login = "$baseUrl/api/v1/auth/login";

  // Wallet
  static const getCoins = "$baseUrl/api/v1/users/coins";
  static const getTransaction = "$baseUrl/api/v1/transaction/history";

  // Game
  static const flipCoin = "$baseUrl/api/v1/games/play";
  static const getGameHistory = "$baseUrl/api/v1/games/history";

}
