import 'package:flutter/material.dart';
import 'package:tripapp/services/tripservice.dart';

import '../models/tripmodels/tripgetmodel.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key, required this.selectedCategory});
  final String selectedCategory;

  @override
  State<StatefulWidget> createState() => _CategoryListScreen();
}

class _CategoryListScreen extends State<CategoryListScreen> {
  TripService service = TripService();
  List<TripModelPayload> trips = [];
  
  @override
  void initState() {
    
    super.initState();
    service.fetchTripWithSearch(search: widget.selectedCategory).then((value) {
      if (value != null && value.payload != null) {
        setState(() {
          trips = value.payload;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(153, 45, 12, 71),
        title: const Text("Selected Kategori"),
      ),
      body: BuildListView()
    );
  }
  Widget BuildListView(){
    return ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 100,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(trips[index].tripImage),
                              minRadius: 70,
                              maxRadius: 70,
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  trips[index].tripName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "                                                    Kaç Gün: "
                                  '${trips[index].tripDays}'
                                  "                                   Fiyat: "
                                  '${trips[index].tripPrice}'
                                  "₺",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_task_rounded),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart)),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "İncele",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(153, 45, 12, 71)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}