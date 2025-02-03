class ProfileModel {
  ProfileModel({
    String? status,
    String? message,
    num? responseCode,
    ProfileData? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  ProfileModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  ProfileData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  ProfileData? get data => _data;

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

class ProfileData {
  ProfileData({
    String? tid,
    String? firstName,
    String? lastName,
    String? mobile,
    String? userName,
    num? winCoin,
    num? gameCoin,
    num? demoCoin,
    num? status,
    String? referCode,
    num? referEarn,
    num? referCount,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _tid = tid;
    _firstName = firstName;
    _lastName = lastName;
    _mobile = mobile;
    _userName = userName;
    _winCoin = winCoin;
    _gameCoin = gameCoin;
    _demoCoin = demoCoin;
    _status = status;
    _referCode = referCode;
    _referEarn = referEarn;
    _referCount = referCount;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  ProfileData.fromJson(dynamic json) {
    _tid = json['tid'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _mobile = json['mobile'];
    _userName = json['userName'];
    _winCoin = json['winCoin'];
    _gameCoin = json['gameCoin'];
    _demoCoin = json['demoCoin'];
    _status = json['status'];
    _referCode = json['referCode'];
    _referEarn = json['referEarn'];
    _referCount = json['referCount'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _tid;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _userName;
  num? _winCoin;
  num? _gameCoin;
  num? _demoCoin;
  num? _status;
  String? _referCode;
  num? _referEarn;
  num? _referCount;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get tid => _tid;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobile => _mobile;
  String? get userName => _userName;
  num? get winCoin => _winCoin;
  num? get gameCoin => _gameCoin;
  num? get demoCoin => _demoCoin;
  num? get status => _status;
  String? get referCode => _referCode;
  num? get referEarn => _referEarn;
  num? get referCount => _referCount;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tid'] = _tid;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['mobile'] = _mobile;
    map['userName'] = _userName;
    map['winCoin'] = _winCoin;
    map['gameCoin'] = _gameCoin;
    map['demoCoin'] = _demoCoin;
    map['status'] = _status;
    map['referCode'] = _referCode;
    map['referEarn'] = _referEarn;
    map['referCount'] = _referCount;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
