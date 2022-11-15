import 'package:flutter/material.dart';
import 'package:tests/quran/model/surat_quran_model.dart';
import 'package:tests/quran/repository/al_quran.dart';
import 'package:tests/quran/theme.dart';



class DetailSurahPage extends StatefulWidget {
  const DetailSurahPage({super.key, required this.dataFromList});
  final SuratQuranModel dataFromList;

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  @override
  Widget build(BuildContext context) {
    DetailRepository repo = DetailRepository();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
          title: Text(widget.dataFromList.namaLatin!),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, size: 32),
              onPressed: () {},
            )
          ],
        ),
        body: FutureBuilder(future: repo.detailSurah(widget.dataFromList.nomor.toString()),builder: ((context, state){
          if (state.hasData){
             return ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.data!.ayat!.length,
                        itemBuilder: (BuildContext context, int index) {
                          // var data = state.detailSurah.ayat![index];
                          var data = state.data!.ayat![index];
                          return GestureDetector(
                            onTap: () {},
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: purpleColor,
                                child: Text(data.nomor.toString(), textAlign: TextAlign.end,),
                              ),
                              title: Text(data.ar.toString()),
                              subtitle: Text(data.id.toString()),
                             
                            ),
                          );
                        });
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        })),
        // body: BlocBuilder<AyatBloc, AyatState>(builder: (context, state) {
        //   if (state is AyatLoadedState) {
        //     return SingleChildScrollView(
        //       child: Padding(
        //         padding: const EdgeInsets.all(16.0),
        //         child: Column(
        //           children: [
        //             Container(
        //               child: Image.asset("assets/detail/card-quran.png"),
        //             ),
        //             ListView.builder(
        //                 physics: const NeverScrollableScrollPhysics(),
        //                 shrinkWrap: true,
        //                 itemCount: state.detailSurah.ayat?.length,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   var data = state.detailSurah.ayat![index];
        //                   return GestureDetector(
        //                     onTap: () {},
        //                     child: ListTile(
        //                       leading: CircleAvatar(
        //                         backgroundColor: purpleColor,
        //                         child: Text(data.id.toString()),
        //                       ),
        //                       title: Text(data.ar.toString()),
        //                       subtitle: Text(data.nomor.toString()),
        //                       trailing: Wrap(spacing: 12, children: <Widget>[
        //                         IconButton(
        //                             onPressed: () {},
        //                             icon: const Icon(
        //                                 Icons.navigate_next_outlined)),
        //                       ]),
        //                     ),
        //                   );
        //                 }),
        //           ],
        //         ),
        //       ),
        //     );
        //   } else {
        //     return const Center(child: CircularProgressIndicator.adaptive());
        //   }
        // }
        // )
        );
  }
}
