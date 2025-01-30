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
    String? id,
    String? tid,
    String? firstName,
    String? mobile,
    num? winCoin,
    num? gameCoin,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _tid = tid;
    _firstName = firstName;
    _mobile = mobile;
    _winCoin = winCoin;
    _gameCoin = gameCoin;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ProfileData.fromJson(dynamic json) {
    _id = json['_id'];
    _tid = json['tid'];
    _firstName = json['firstName'];
    _mobile = json['mobile'];
    _winCoin = json['winCoin'];
    _gameCoin = json['gameCoin'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _tid;
  String? _firstName;
  String? _mobile;
  num? _winCoin;
  num? _gameCoin;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get tid => _tid;
  String? get firstName => _firstName;
  String? get mobile => _mobile;
  num? get winCoin => _winCoin;
  num? get gameCoin => _gameCoin;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['tid'] = _tid;
    map['firstName'] = _firstName;
    map['mobile'] = _mobile;
    map['winCoin'] = _winCoin;
    map['gameCoin'] = _gameCoin;
    map['status'] = _status;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
