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
    String? tid,
    num? amount,
    String? mode,
    num? coinType,
    num? txnType,
    num? status,
    num? statusBack,
    String? details,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _tid = tid;
    _amount = amount;
    _mode = mode;
    _coinType = coinType;
    _txnType = txnType;
    _status = status;
    _statusBack = statusBack;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  TransactionData.fromJson(dynamic json) {
    _id = json['_id'];
    _tid = json['tid'];
    _amount = json['amount'];
    _mode = json['mode'];
    _coinType = json['coinType'];
    _txnType = json['txnType'];
    _status = json['status'];
    _statusBack = json['statusBack'];
    _details = json['details'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _tid;
  num? _amount;
  String? _mode;
  num? _coinType;
  num? _txnType;
  num? _status;
  num? _statusBack;
  String? _details;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get tid => _tid;
  num? get amount => _amount;
  String? get mode => _mode;
  num? get coinType => _coinType;
  num? get txnType => _txnType;
  num? get status => _status;
  num? get statusBack => _statusBack;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['tid'] = _tid;
    map['amount'] = _amount;
    map['mode'] = _mode;
    map['coinType'] = _coinType;
    map['txnType'] = _txnType;
    map['status'] = _status;
    map['statusBack'] = _statusBack;
    map['details'] = _details;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
