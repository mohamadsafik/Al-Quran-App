import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/helpers/bloc_observer.dart';
import 'package:tests/quran/bloc/detail_surah_bloc.dart';
import 'package:tests/quran/bloc/detail_surah_event.dart';
import 'package:tests/quran/bloc/list_surat_bloc.dart';
import 'package:tests/quran/bloc/list_surat_event.dart';
import 'package:tests/quran/views/list_surah.dart';
import 'package:tests/trash/location_event.dart';
import 'package:tests/trash/locations_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
        BlocProvider<ListSurahBloc>(
          create: (BuildContext context) => ListSurahBloc()..add(ListSurahLoadedEvent()),
        ),
        BlocProvider<DetailSurahBloc>(
          create: (BuildContext context) => DetailSurahBloc()..add(DetailSurahLoadedEvent(urlID: '1')),
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
