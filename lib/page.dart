import 'package:flutter/material.dart';
import 'package:tests/repository.dart';
import 'package:tests/models/location_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocationModel loc = LocationModel();
  final LocationRepository data = LocationRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.blue),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("DKI JAKARTA"),
                Text("Kota Jakarta Barat"),
                Text("21 Celcius"),
                Text("Jumat, 12 November 2022, 09.00"),
                Text("Cerah Berawan"),
                Text(data.toString())
              ],
            )),
          ),
        ),
        Positioned(
          top: 500,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
