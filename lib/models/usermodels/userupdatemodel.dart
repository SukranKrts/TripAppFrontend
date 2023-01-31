class UserUpdateModel {
  late int id;
  late String userName;
  late String userMail;
  late String userPhone;
  late String userPassword;

  UserUpdateModel({
    required this.id,
    required this.userName,
    required this.userMail,
    required this.userPhone,
    required this.userPassword,
  });
  UserUpdateModel.fromJson(Map<String, dynamic> json) {
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