import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tripapp/models/usermodels/usermodel.dart';

class UserService{
  final dio = Dio();
  Future<UserModel?> userSignIn({
    required String userMail, required String userPassword }) async{
      Map<String, dynamic> json = {'userMail': userMail,'userPassword': userPassword};
      const String baseurl = 'https://10.0.2.2:7289/api/User/LoginUser';
      var response = await dio.post(baseurl, data: json);
      if(response.statusCode == 200){
        var result = UserModel.fromJson(response.data);
        log("Gelen response => ${response.data}");
        return result;
      }
      else{
        throw{"Bir sorun oluştu! ${response.statusCode}"};

      }
  }
  Future<UserModel?> userLogin({
    required String userName, required String userMail, required String userPhone, required String userPassword,}) async{
      Map<String, dynamic> json = {'userName': userName, 'userMail': userMail, 'userPhone':userPhone, 'userPassword': userPassword};
      const String url = 'https://10.0.2.2:7289/api/User/CreateUser';
      var response = await dio.post(url, data: json);
      if(response.statusCode == 200){
        var result = UserModel.fromJson(response.data);
        log("Gelen response => ${response.data}");
        return result;
      }
      else{
        throw{"Bir hata oluştu kayıt başarısız! ${response.statusCode}"};
      }
    }
}