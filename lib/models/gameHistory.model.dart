class GameHistoryModel {
  GameHistoryModel({
    String? status,
    String? message,
    num? responseCode,
    List<GameHistoryData>? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  GameHistoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GameHistoryData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<GameHistoryData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<GameHistoryData>? get data => _data;

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

class GameHistoryData {
  GameHistoryData({
    String? id,
    String? userId,
    num? joinAmount,
    num? winAmount,
    String? chooseOption,
    String? resultOption,
    bool? isWin,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _joinAmount = joinAmount;
    _winAmount = winAmount;
    _chooseOption = chooseOption;
    _resultOption = resultOption;
    _isWin = isWin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  GameHistoryData.fromJson(dynamic json) {
    _id = json['_id'];
    _userId = json['userId'];
    _joinAmount = json['joinAmount'];
    _winAmount = json['winAmount'];
    _chooseOption = json['chooseOption'];
    _resultOption = json['resultOption'];
    _isWin = json['isWin'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _userId;
  num? _joinAmount;
  num? _winAmount;
  String? _chooseOption;
  String? _resultOption;
  bool? _isWin;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get userId => _userId;
  num? get joinAmount => _joinAmount;
  num? get winAmount => _winAmount;
  String? get chooseOption => _chooseOption;
  String? get resultOption => _resultOption;
  bool? get isWin => _isWin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userId'] = _userId;
    map['joinAmount'] = _joinAmount;
    map['winAmount'] = _winAmount;
    map['chooseOption'] = _chooseOption;
    map['resultOption'] = _resultOption;
    map['isWin'] = _isWin;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
