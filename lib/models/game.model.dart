class GameModel {
  GameModel({
    String? status,
    String? message,
    num? responseCode,
    GameData? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  GameModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? GameData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  GameData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  GameData? get data => _data;

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

class GameData {
  GameData({
    String? userId,
    num? joinAmount,
    num? winAmount,
    String? chooseOption,
    String? resultOption,
    bool? isWin,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _userId = userId;
    _joinAmount = joinAmount;
    _winAmount = winAmount;
    _chooseOption = chooseOption;
    _resultOption = resultOption;
    _isWin = isWin;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  GameData.fromJson(dynamic json) {
    _userId = json['userId'];
    _joinAmount = json['joinAmount'];
    _winAmount = json['winAmount'];
    _chooseOption = json['chooseOption'];
    _resultOption = json['resultOption'];
    _isWin = json['isWin'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _userId;
  num? _joinAmount;
  num? _winAmount;
  String? _chooseOption;
  String? _resultOption;
  bool? _isWin;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get userId => _userId;
  num? get joinAmount => _joinAmount;
  num? get winAmount => _winAmount;
  String? get chooseOption => _chooseOption;
  String? get resultOption => _resultOption;
  bool? get isWin => _isWin;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['joinAmount'] = _joinAmount;
    map['winAmount'] = _winAmount;
    map['chooseOption'] = _chooseOption;
    map['resultOption'] = _resultOption;
    map['isWin'] = _isWin;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
