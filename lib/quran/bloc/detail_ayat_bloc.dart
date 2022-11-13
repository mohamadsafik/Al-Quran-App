import 'package:bloc/bloc.dart';
import 'package:tests/quran/bloc/detail_ayat_event.dart';
import 'package:tests/quran/bloc/detail_ayat_state.dart';

import '../repository/al_quran.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final quranRepository = QuranRepository();
  AyatBloc() : super(AyatLoadingState()) {
    on<AyatEvent>((event, emit) async {
      if (state is AyatLoadedState) {
        emit(AyatLoadingState());
      }
      // try {
      final detailSurah = await quranRepository.getAyat("1");
      emit(AyatLoadedState(detailSurah: detailSurah, urlId: "1"));
      // } catch (e) {
      // emit(AyatErrorState());

      // }
      // ;
    });
  }
}
