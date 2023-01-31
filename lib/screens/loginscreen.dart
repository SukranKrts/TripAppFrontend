import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/userservice.dart';
import '../widgets/mybottomnavigationbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final userService = UserService();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromARGB(153, 45, 12, 71),
                        Color.fromARGB(153, 80, 31, 121),
                        Color.fromARGB(153, 89, 34, 134)
                      ])),
                  child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 120),
                      child: Form(
                        key: formKey,
                        child: Column(children: <Widget>[
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              controller: _nameController,
                              style: const TextStyle(color: Colors.black87),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(153, 45, 12, 71),
                                  ),
                                  hintText: "İsim Soyisim",
                                  hintStyle: TextStyle(color: Colors.black38)),
                              validator: (value) {
                                if (value!.length < 3) {
                                  return "İsim alanı en az 3 karakter olmalıdır!";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                String pattern =
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                    r"{0,253}[a-zA-Z0-9])?)*$";
                                RegExp regex = RegExp(pattern);
                                if (value == null ||
                                    value.isEmpty ||
                                    !regex.hasMatch(value)) {
                                  return "Geçerli bir eposta adresi giriniz";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.black87),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Color.fromARGB(153, 45, 12, 71),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black38)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              controller: _phoneController,
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen telefon numarası giriniz!';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Lütfen geçerli bir telefon numarası girin!';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.black87),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Color.fromARGB(153, 45, 12, 71),
                                  ),
                                  hintText: "Telefon numarası",
                                  hintStyle: TextStyle(color: Colors.black38)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              controller: _passwordController1,
                              validator: (value) {
                                String pattern =
                                    "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}";
                                RegExp regex = RegExp(pattern);
                                if (value == null ||
                                    value.isEmpty ||
                                    !regex.hasMatch(value)) {
                                  return "Güçlü bir şifre oluşturunuz!";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.black87),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(153, 45, 12, 71),
                                  ),
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(color: Colors.black38)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              controller: _passwordController2,
                              validator: (value) {
                                if(_passwordController1 != _passwordController2){
                                  return "Şifreniz eşleşmiyor!";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.black87),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(153, 45, 12, 71),
                                  ),
                                  hintText: "Şifre tekrar",
                                  hintStyle: TextStyle(color: Colors.black38)),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          buildLoginBtn(
                              formKey,
                              _nameController.text,
                              _emailController.text,
                              _phoneController.text,
                              _passwordController1.text,
                              _passwordController2.text)
                        ]),
                      )),
                )
              ],
            ),
          )),
    );
  }

  Widget buildLoginBtn(GlobalKey<FormState> formKey, String name, String email, String phone,
      String password1, String password2) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (() {
          if (formKey.currentState!.validate()) {
            userService.userLogin(
                userName: name, userMail: email, userPhone: phone, userPassword: password1);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyBottomNavigationBar()));
          }
        }),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        ),
        child: const Text(
          "Kayıt Ol",
          style: TextStyle(
              color: Colors.black38, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}