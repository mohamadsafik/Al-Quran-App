import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/quran/bloc/detail_ayat_bloc.dart';

import '../bloc/detail_ayat_state.dart';

class ListAyatPage extends StatefulWidget {
  const ListAyatPage({
    super.key,
  });

  @override
  State<ListAyatPage> createState() => _ListAyatPageState();
}

class _ListAyatPageState extends State<ListAyatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AyatBloc, AyatState>(builder: (context, state) {
          if (state is AyatLoadedState) {
            return ListView.builder(
                itemCount: state.detailSurah.ayat?.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = state.detailSurah.ayat![index];
                  return GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(data.id.toString()),
                      ),
                      title: Text(data.ar.toString()),
                      subtitle: Text(data.nomor.toString()),
                      trailing: Wrap(spacing: 12, children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next_outlined)),
                      ]),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        }));
  }
}
