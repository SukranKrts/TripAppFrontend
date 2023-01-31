import 'package:flutter/material.dart';

class MyCardInfo extends StatefulWidget{
  const MyCardInfo({super.key});

  @override
  State<StatefulWidget> createState() => _MyCardInfo();

}

class _MyCardInfo extends State<MyCardInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5ac18e),
        title: const Text("Kart Bilgilerim"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
        child: ListView(
          children: [
            buildTextField("","Kart İsmi"),
            buildTextField("","Kart Numarası"),
            buildTextField("","Son Kullanım Tarihi")
          ],
        ),
      ),
    );
  }

  buildTextField(String labelText, String placeHolder){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
      ),
      );
  }
}