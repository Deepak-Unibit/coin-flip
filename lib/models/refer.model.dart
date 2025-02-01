class ReferModel {
  ReferModel({
    String? status,
    String? message,
    num? responseCode,
    List<ReferData>? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  ReferModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ReferData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<ReferData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<ReferData>? get data => _data;

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

class ReferData {
  ReferData({
    String? id,
    String? referCode,
    String? newTid,
    bool? isBonusSend,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _referCode = referCode;
    _newTid = newTid;
    _isBonusSend = isBonusSend;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ReferData.fromJson(dynamic json) {
    _id = json['_id'];
    _referCode = json['referCode'];
    _newTid = json['newTid'];
    _isBonusSend = json['isBonusSend'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _referCode;
  String? _newTid;
  bool? _isBonusSend;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get referCode => _referCode;
  String? get newTid => _newTid;
  bool? get isBonusSend => _isBonusSend;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['referCode'] = _referCode;
    map['newTid'] = _newTid;
    map['isBonusSend'] = _isBonusSend;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
