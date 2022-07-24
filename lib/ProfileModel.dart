/// data : [{"firstName":"Sachin","lastName":"Rajput","employeeId":1},{"firstName":"Sachin","lastName":"Rajput","employeeId":2}]

class ProfileModel {
  ProfileModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  ProfileModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? _data;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// firstName : "Sachin"
/// lastName : "Rajput"
/// employeeId : 1

class Data {
  Data({
    String? firstName,
    String? lastName,
    int? employeeId,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _employeeId = employeeId;
  }

  Data.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _employeeId = json['employeeId'];
  }

  String? _firstName;
  String? _lastName;
  int? _employeeId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  int? get employeeId => _employeeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['employeeId'] = _employeeId;
    return map;
  }
}
