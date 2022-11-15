import 'package:bloc/bloc.dart';
import 'package:tests/quran/bloc/detail_surah_event.dart';
import 'package:tests/quran/bloc/detail_surah_state.dart';

import '../repository/al_quran.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  final detailRepository = QuranRepository();
  DetailSurahBloc() : super(DetailSurahLoadingState()) {
    on<DetailSurahEvent>((event, emit) async {
      if (state is DetailSurahLoadedState) {
        emit(DetailSurahLoadingState());
      }
      // try {
      final detailSurah = await detailRepository.detailSurah("1");
      emit(DetailSurahLoadedState(detailSurah: detailSurah));
      // } catch (e) {
      // emit(AyatErrorState());

      // }
      // ;
    });
  }
}
