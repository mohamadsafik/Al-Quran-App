import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/quran/bloc/surat_bloc.dart';
import 'package:tests/quran/bloc/surat_state.dart';
import 'package:tests/quran/model/surat_quran_model.dart';
import 'package:tests/quran/views/detail_surah.dart';

class ListSuratQuran extends StatefulWidget {
  const ListSuratQuran({super.key});

  @override
  State<ListSuratQuran> createState() => _ListSuratQuranState();
}

class _ListSuratQuranState extends State<ListSuratQuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<SuratBloc, SuratState>(builder: (context, state) {
          if (state is SuratLoadedState) {
            return ListView.builder(
                itemCount: state.suratQuran.length,
                itemBuilder: (BuildContext context, int index) {
                  SuratQuranModel data = state.suratQuran[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListAyatPage()),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(data.nomor.toString()),
                      ),
                      title: Text(data.namaLatin.toString()),
                      subtitle: Text(data.nama.toString()),
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
