import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/quran/bloc/list_surat_bloc.dart';
import 'package:tests/quran/bloc/list_state.dart';
import 'package:tests/model/list_surah_model.dart';
import 'package:tests/helpers/theme.dart';
import 'package:tests/quran/views/detail_surah.dart';
import 'package:shimmer/shimmer.dart';

class ListSuratQuran extends StatefulWidget {
  const ListSuratQuran({super.key});

  @override
  State<ListSuratQuran> createState() => _ListSuratQuranState();
}

class _ListSuratQuranState extends State<ListSuratQuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
          leading: const Icon(Icons.menu_rounded),
          title: const Text("Quran App"),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 32,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: BlocBuilder<ListSurahBloc, ListSurahState>(builder: (context, state) {
                  if (state is ListSurahLoadedState) {
                    return  SingleChildScrollView(
                      child: Padding(
                                padding: const EdgeInsets.all(16.0),
                        child: Column(
                                    children: [
                            Container(
                                        width: MediaQuery.of(context).size.height,
                                child: Image.asset("assets/list/quran-home.png"),),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.listSurahQuran.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    ListSurahModel data = state.listSurahQuran[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailSurahPage(
                                                  dataFromList: state.listSurahQuran[index])),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Stack(children: [
                                          Image.asset("assets/list/number.png"),
                                          Positioned(
                                              top: 10,
                                              left: 12,
                                              child: Text(data.nomor.toString())),
                                        ]),
                                        title: Text(data.namaLatin.toString()),
                                        subtitle: Text(
                                            "Total Ayat : ${data.jumlahAyat.toString()}"),
                                        trailing: Wrap(spacing: 12, children: <Widget>[
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.navigate_next_outlined)),
                                        ]),
                                      ),
                                    );
                                  }),
                          ],
                        ),
                      ),
                    );
                  } else {
               return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {return Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                      child: ListTile(textColor:  Colors.grey.withOpacity(0.5),
                      iconColor: Colors.grey.withOpacity(0.5),
                                  leading: Stack(children: [
                                    Image.asset("assets/list/number.png",color: Colors.grey.withOpacity(0.5),),
                                     Positioned(
                                        top: 10,
                                        left: 12,
                                        child: Container(color: Colors.grey.withOpacity(0.5),child: Text(""))),
                                  ]),
                                  title: Container(color: Colors.grey.withOpacity(0.5),child: const Text("")),
                                  subtitle: Container(color: Colors.grey.withOpacity(0.5),
                                    child: const Text(
                                        ""),
                                  ),
                                  trailing: Wrap(spacing: 12, children: <Widget>[
                                    IconButton(
                                        onPressed: () {},
                                        icon:  const Icon(
                                            Icons.navigate_next_outlined)),
                                  ]),
                                ),
                    ); },
                    
                  );
                
                  }
                }));
  }
}
