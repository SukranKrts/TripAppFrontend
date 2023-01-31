import 'package:flutter/material.dart';
import 'package:tripapp/listscreens/categorylistscreen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  final List<String> _categories = <String>[
    "Ege Turu",
    "Karadeniz Turu",
    "GAP Turu",
    "Mavi Tur",
    "Avrupa Turu",
    "Asya Turu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Katagoriler"),
        backgroundColor: const Color.fromARGB(153, 45, 12, 71),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 16),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(_categories[index],
                      style: const TextStyle(fontSize: 17)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CategoryListScreen(selectedCategory: _categories[index]))); //selectedCategory: _categories[index],
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: _categories.length,
          )),
    );
  }
}
