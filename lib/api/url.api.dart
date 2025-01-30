import 'app.const.dart';

class UrlApi {
  static const String baseUrl = AppConst.baseUrl;

  // Auth
  static const login = "$baseUrl/api/v1/auth/login";

  // Wallet
  static const getTransaction = "$baseUrl/api/v1/transaction/history";

}
