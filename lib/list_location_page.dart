import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/locations_bloc.dart';
import 'package:tests/models/location_model.dart';
import 'package:tests/location_state.dart';

class ListLocationPage extends StatefulWidget {
  const ListLocationPage({super.key});

  @override
  State<ListLocationPage> createState() => _ListLocationPageState();
}

class _ListLocationPageState extends State<ListLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
        if (state is LocationLoadState) {
          return ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (BuildContext context, int index) {
                LocationModel data = state.locations[index];
                return ListTile(
                  title: Text(data.kota.toString()),
                  // subtitle: Text(data.propinsi.toString()),
                );
              });
        } else {
          return CircularProgressIndicator.adaptive();
        }
      }),
    );
  }
}
