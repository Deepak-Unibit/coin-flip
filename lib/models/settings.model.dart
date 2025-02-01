class SettingsModel {
  SettingsModel({
    String? status,
    String? message,
    num? responseCode,
    SettingsData? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  SettingsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? SettingsData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  SettingsData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  SettingsData? get data => _data;

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

class SettingsData {
  SettingsData({
    String? id,
    num? signupReferBonus,
    num? referCommission,
    bool? isReferCommissionOn,
    bool? isSignUpReferBonusOn,
  }) {
    _id = id;
    _signupReferBonus = signupReferBonus;
    _referCommission = referCommission;
    _isReferCommissionOn = isReferCommissionOn;
    _isSignUpReferBonusOn = isSignUpReferBonusOn;
  }

  SettingsData.fromJson(dynamic json) {
    _id = json['_id'];
    _signupReferBonus = json['signupReferBonus'];
    _referCommission = json['referCommission'];
    _isReferCommissionOn = json['isReferCommissionOn'];
    _isSignUpReferBonusOn = json['isSignUpReferBonusOn'];
  }
  String? _id;
  num? _signupReferBonus;
  num? _referCommission;
  bool? _isReferCommissionOn;
  bool? _isSignUpReferBonusOn;

  String? get id => _id;
  num? get signupReferBonus => _signupReferBonus;
  num? get referCommission => _referCommission;
  bool? get isReferCommissionOn => _isReferCommissionOn;
  bool? get isSignUpReferBonusOn => _isSignUpReferBonusOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['signupReferBonus'] = _signupReferBonus;
    map['referCommission'] = _referCommission;
    map['isReferCommissionOn'] = _isReferCommissionOn;
    map['isSignUpReferBonusOn'] = _isSignUpReferBonusOn;
    return map;
  }
}
