import 'package:flutter/material.dart';
import 'package:tripapp/screens/tripdetailscreen.dart';
import 'package:tripapp/widgets/myappbar.dart';
import 'package:tripapp/services/tripservice.dart';

import '../models/tripmodels/tripgetmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  TripService service = TripService();
  List<TripModelPayload> trips = [];

  @override
  void initState() {
    super.initState();
    service.fetchTrip().then((value) {
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
      appBar: const MyAppBar(),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 110,
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
                          color: const Color.fromARGB(153, 45, 12, 71),
                        ),
                        IconButton(
                            onPressed: () { },
                            icon: const Icon(Icons.add_shopping_cart),
                            color: const Color.fromARGB(153, 45, 12, 71),
                            ),                            
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(id: trips[index].id),));
                          },
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
      ),
    );
  }
}