import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBar();

  @override
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBar extends State<MyAppBar>{
  TextEditingController searchController = TextEditingController();
  List<String> searchLists=[];

  @override
  Widget build(BuildContext context) {
   return AppBar(
    automaticallyImplyLeading: false,
    title: const Text("Seyahat Uygulaması", 
    style: TextStyle(
      color: Colors.white, 
      fontWeight: FontWeight.bold, 
      fontSize: 22),),
    backgroundColor: const Color.fromARGB(153, 45, 12, 71),
    actions: <Widget>[
      IconButton(onPressed: (){
        showSearch(context: context, delegate: Search());
      }, 
      icon: const Icon(Icons.search),
      )
    ],
   );
  }
}

class Search extends SearchDelegate{

  final searchLists = [];
  final recentSearch = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query.isEmpty ? close(context, null) : query = "";
      }, 
      icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        )
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchs = query.isEmpty ? recentSearch : searchLists;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.clear),
        title: Text(searchs[index]),
      ),
      itemCount: searchs.length,
      );
  }
}