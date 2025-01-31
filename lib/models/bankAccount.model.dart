class BankAccountModel {
  BankAccountModel({
    String? status,
    String? message,
    num? responseCode,
    List<BankAccountData>? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  BankAccountModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BankAccountData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<BankAccountData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<BankAccountData>? get data => _data;

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

class BankAccountData {
  BankAccountData({
    String? id,
    String? userId,
    String? accountHolderName,
    String? accountNumber,
    String? ifscCode,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _accountHolderName = accountHolderName;
    _accountNumber = accountNumber;
    _ifscCode = ifscCode;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  BankAccountData.fromJson(dynamic json) {
    _id = json['_id'];
    _userId = json['userId'];
    _accountHolderName = json['accountHolderName'];
    _accountNumber = json['accountNumber'];
    _ifscCode = json['ifscCode'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _userId;
  String? _accountHolderName;
  String? _accountNumber;
  String? _ifscCode;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get userId => _userId;
  String? get accountHolderName => _accountHolderName;
  String? get accountNumber => _accountNumber;
  String? get ifscCode => _ifscCode;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userId'] = _userId;
    map['accountHolderName'] = _accountHolderName;
    map['accountNumber'] = _accountNumber;
    map['ifscCode'] = _ifscCode;
    map['status'] = _status;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
