class UserModelPayload {
  late int id;
  late String userName;
  late String userMail;

  UserModelPayload({
    required this.id,
    required this.userName,
    required this.userMail,
  });
  UserModelPayload.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userName = json['userName'].toString();
    userMail = json['userMail'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['userMail'] = userMail;
    return data;
  }
}
class UserModel {
  late UserModelPayload payload;
  late bool success;
  late String information;

  UserModel({
    required this.payload,
    required this.success,
    required this.information,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    payload = ((json['payload'] != null) ? UserModelPayload.fromJson(json['payload']) : null)!;
    success = json['success'];
    information = json['information'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (payload != null) {
      data['payload'] = payload.toJson();
    }
    data['success'] = success;
    data['information'] = information;
    return data;
  }
}