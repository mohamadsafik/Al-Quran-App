import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/list_location_page.dart';
import 'package:tests/locations_bloc.dart';

import 'package:tests/models/location_model.dart';
import 'package:tests/location_event.dart';
import 'package:tests/quran/bloc/detail_ayat_bloc.dart';
import 'package:tests/quran/bloc/detail_ayat_event.dart';
import 'package:tests/quran/bloc/surat_bloc.dart';
import 'package:tests/quran/bloc/surat_event.dart';
import 'package:tests/quran/views/list_surah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
          create: (BuildContext context) =>
              LocationBloc()..add(LocationLoadEvent()),
        ),
        BlocProvider<SuratBloc>(
          create: (BuildContext context) => SuratBloc()..add(SuratLoadEvent()),
        ),
        BlocProvider<AyatBloc>(
          create: (BuildContext context) => AyatBloc()..add(AyatLoadedEvent(urlID: '1')),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListSuratQuran(),
      ),
    );
  }
}
