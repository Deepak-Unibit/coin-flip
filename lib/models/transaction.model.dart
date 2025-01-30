class TransactionModel {
  TransactionModel({
    String? status,
    String? message,
    num? responseCode,
    List<TransactionData>? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  TransactionModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TransactionData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<TransactionData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<TransactionData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TransactionData {
  TransactionData({
    String? id,
    String? userId,
    String? gameId,
    num? amount,
    String? mode,
    num? coinType,
    num? txnType,
    num? status,
    num? statusBack,
    String? details,
    String? createdAt,
    String? updatedAt,
    num? currentBalance,
  }) {
    _id = id;
    _userId = userId;
    _gameId = gameId;
    _amount = amount;
    _mode = mode;
    _coinType = coinType;
    _txnType = txnType;
    _status = status;
    _statusBack = statusBack;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currentBalance = currentBalance;
  }

  TransactionData.fromJson(dynamic json) {
    _id = json['_id'];
    _userId = json['userId'];
    _gameId = json['gameId'];
    _amount = json['amount'];
    _mode = json['mode'];
    _coinType = json['coinType'];
    _txnType = json['txnType'];
    _status = json['status'];
    _statusBack = json['statusBack'];
    _details = json['details'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _currentBalance = json['currentBalance'];
  }
  String? _id;
  String? _userId;
  String? _gameId;
  num? _amount;
  String? _mode;
  num? _coinType;
  num? _txnType;
  num? _status;
  num? _statusBack;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
  num? _currentBalance;

  String? get id => _id;
  String? get userId => _userId;
  String? get gameId => _gameId;
  num? get amount => _amount;
  String? get mode => _mode;
  num? get coinType => _coinType;
  num? get txnType => _txnType;
  num? get status => _status;
  num? get statusBack => _statusBack;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get currentBalance => _currentBalance;

  set setCurrentBalance(num value) => _currentBalance = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userId'] = _userId;
    map['gameId'] = _gameId;
    map['amount'] = _amount;
    map['mode'] = _mode;
    map['coinType'] = _coinType;
    map['txnType'] = _txnType;
    map['status'] = _status;
    map['statusBack'] = _statusBack;
    map['details'] = _details;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['currentBalance'] = _currentBalance;
    return map;
  }
}
