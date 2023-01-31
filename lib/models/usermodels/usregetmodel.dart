class UserGetModelPayload {
  late int id;
  late String userName;
  late String userMail;
  late String userPhone;
  late String userPassword;

  UserGetModelPayload({
    required this.id,
    required this.userName,
    required this.userMail,
    required this.userPhone,
    required this.userPassword,
  });
  UserGetModelPayload.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userName = json['userName'].toString();
    userMail = json['userMail'].toString();
    userPhone = json['userPhone'].toString();
    userPassword = json['userPassword'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['userMail'] = userMail;
    data['userPhone'] = userPhone;
    data['userPassword'] = userPassword;
    return data;
  }
}
class UserGetModel {
  late bool success;
  late String information;
  late List<UserGetModelPayload> payload;

  UserGetModel({
    required this.success,
    required this.information,
    required this.payload,
  });
  UserGetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    information = json['information'].toString();
  if (json['payload'] != null) {
  final v = json['payload'];
  final arr0 = <UserGetModelPayload>[];
  v.forEach((v) {
  arr0.add(UserGetModelPayload.fromJson(v));
  });
    payload = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['information'] = information;
    if (payload != null) {
      final v = payload;
      final arr0 = [];
  v.forEach((v) {
  arr0.add(v.toJson());
  });
      data['payload'] = arr0;
    }
    return data;
  }
}