import 'app.const.dart';

class UrlApi {
  static const String baseUrl = AppConst.baseUrl;

  // Auth
  static const login = "$baseUrl/api/v1/auth/login";

  // Wallet
  static const getCoins = "$baseUrl/api/v1/users/coins";
  static const getTransaction = "$baseUrl/api/v1/transaction/history";
  static const addBankAccount = "$baseUrl/api/v1/users/add-account";
  static const getAccountList = "$baseUrl/api/v1/users/account-list";
  static const withdrawCoin = "$baseUrl/api/v1/users/coins/withdraw";
  static const depositCoin = "$baseUrl/api/v1/users/coins/deposit";

  // Game
  static const flipCoin = "$baseUrl/api/v1/games/play";
  static const getGameHistory = "$baseUrl/api/v1/games/history";

  // Demo
  static const demoFlipCoin = "$baseUrl/api/v1/games/play-demo";

  // History
  static const getReferHistory = "$baseUrl/api/v1/users/refer-list";

  // Settings
  static const getSettings = "$baseUrl/api/v1/static/settings";

}
