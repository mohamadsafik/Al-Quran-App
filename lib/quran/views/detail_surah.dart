import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/quran/bloc/detail_ayat_bloc.dart';
import 'package:tests/quran/model/surat_quran_model.dart';
import 'package:tests/quran/theme.dart';

import '../bloc/detail_ayat_state.dart';

class ListAyatPage extends StatelessWidget {
  const ListAyatPage({super.key, required this.dataFromList});
  final SuratQuranModel dataFromList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
          title: Text(dataFromList.namaLatin!),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, size: 32),
              onPressed: () {},
            )
          ],
        ),
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
                        backgroundColor: purpleColor,
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
