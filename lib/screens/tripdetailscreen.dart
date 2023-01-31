import 'package:flutter/material.dart';
import 'package:tripapp/models/tripmodels/tripgetby%C4%B1dmodel.dart';
import 'package:tripapp/services/tripservice.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});
  final int id;

  @override
  State<StatefulWidget> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  TripService service = TripService();
  List<TripGetByIdPayload> trip = [];

  @override
  void initState() {
    super.initState();
    service.fetchTripGetById(id: widget.id).then((value) => {
          if (value != null && value.payload != null)
            {
              setState(
                () {
                  trip = value.payload;
                },
              )
            }
        });
  }

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip[index].tripType),
        backgroundColor: const Color.fromARGB(153, 89, 34, 134),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(trip[index].tripImage),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: const Offset(0, -4),
                        blurRadius: 8)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                    child: Text(
                      trip[index].tripName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                    child: Text(
                      '${trip[index].tripPrice}' "₺",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                    child: Text(
                      trip[index].whereFrom,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                    child: Text(
                      trip[index].tripDetail,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                    child: Text(
                      trip[index].ourServices,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_task_rounded),
                          color: const Color.fromARGB(153, 45, 12, 71),
                          iconSize: 40,
                        ),
                      ),
                      Padding(
                        
                        padding: const EdgeInsets.only(top: 50, right: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart),
                          color: const Color.fromARGB(153, 45, 12, 71),
                          iconSize: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}