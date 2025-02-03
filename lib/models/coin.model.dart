class CoinModel {
  CoinModel({
    String? status,
    String? message,
    num? responseCode,
    CoinData? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  CoinModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? CoinData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  CoinData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  CoinData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class CoinData {
  CoinData({
    String? id,
    num? winCoin,
    num? gameCoin,
    num? demoCoin,
    num? totalCoin,
  }) {
    _id = id;
    _winCoin = winCoin;
    _gameCoin = gameCoin;
    _demoCoin = demoCoin;
    _totalCoin = totalCoin;
  }

  CoinData.fromJson(dynamic json) {
    _id = json['_id'];
    _winCoin = json['winCoin'];
    _gameCoin = json['gameCoin'];
    _demoCoin = json['demoCoin'];
    _totalCoin = json['totalCoin'];
  }
  String? _id;
  num? _winCoin;
  num? _gameCoin;
  num? _demoCoin;
  num? _totalCoin;

  String? get id => _id;
  num? get winCoin => _winCoin;
  num? get gameCoin => _gameCoin;
  num? get demoCoin => _demoCoin;
  num? get totalCoin => _totalCoin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['winCoin'] = _winCoin;
    map['gameCoin'] = _gameCoin;
    map['demoCoin'] = _demoCoin;
    map['totalCoin'] = _totalCoin;
    return map;
  }
}
