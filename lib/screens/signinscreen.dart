import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripapp/services/userservice.dart';
import 'package:tripapp/widgets/mybottomnavigationbar.dart';
import 'loginscreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreen();
}

class _SignInScreen extends State {
  final formKey = GlobalKey<FormState>();
  final userService = UserService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                        horizontal: 15, vertical: 100),
                    child: Form(
                      key: formKey,
                      child: Column(children: <Widget>[
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/images.jpg'),
                          minRadius: 90,
                          maxRadius: 90,
                        ),
                        const SizedBox(
                          height: 25,
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
                          height: 20,
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
                            controller: _passwordController,
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
                          height: 15,
                        ),
                        buildLoginTextBtn(),
                        const SizedBox(
                          height: 35,
                        ),
                        buildSignInBtn(formKey, _emailController.text,
                            _passwordController.text),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget buildLoginTextBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        child: const Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignInBtn(
      GlobalKey<FormState> formKey, String email, String password) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (() {
          if (formKey.currentState!.validate()) {
            userService.userSignIn(userMail: email, userPassword: password);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyBottomNavigationBar()));
          }
        }),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        ),
        child: const Text(
          "Giriş Yap",
          style: TextStyle(
              color: Colors.black38, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
