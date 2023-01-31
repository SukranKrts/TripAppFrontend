import 'package:flutter/material.dart';

import '../listscreens/listscreengetbyıd.dart';

class FavoriteScreen extends StatefulWidget{
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beğendiklerim"),
        backgroundColor: const Color.fromARGB(153, 89, 34, 134),
      ),
      body: const ListScreenById(deger: 1,)
    );
  }
}