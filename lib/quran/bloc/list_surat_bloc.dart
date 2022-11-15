import 'package:bloc/bloc.dart';

import 'package:tests/quran/bloc/list_state.dart';
import 'package:tests/quran/bloc/list_surat_event.dart';
import 'package:tests/quran/repository/al_quran.dart';

class ListSurahBloc extends Bloc<ListSurahEvent, ListSurahState> {
  final quranRepository = QuranRepository();

  ListSurahBloc() : super(ListSurahLoadingState()) {
    on<ListSurahEvent>((event, emit) async {
      if (event is ListSurahLoadedState) {
        emit(ListSurahLoadingState());
      }
      try {
        final listSurah = await quranRepository.getListSurah();
        emit(ListSurahLoadedState(listSurahQuran: listSurah));
      } catch (e) {
        emit(ListSurahErrorState(error: e.toString()));
      }
    });
  }
}
