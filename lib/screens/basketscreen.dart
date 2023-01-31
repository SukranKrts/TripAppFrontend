import 'package:flutter/material.dart';
import 'package:tripapp/listscreens/listscreengetby%C4%B1d.dart';

class BasketScreen extends StatefulWidget{
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreen();
}

class _BasketScreen extends State<BasketScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
        backgroundColor: const Color.fromARGB(153, 89, 34, 134),
      ),
      body: const ListScreenById(deger: 2,)
    );
  }
}