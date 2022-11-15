import 'package:bloc/bloc.dart';
import 'package:tests/quran/bloc/detail_ayat_event.dart';
import 'package:tests/quran/bloc/detail_ayat_state.dart';

import '../repository/al_quran.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final detailRepository = DetailRepository();
  AyatBloc() : super(AyatLoadingState()) {
    on<AyatEvent>((event, emit) async {
      if (state is AyatLoadedState) {
        emit(AyatLoadingState());
      }
      // try {
      final detailSurah = await detailRepository.detailSurah("1");
      emit(AyatLoadedState(detailSurah: detailSurah));
      // } catch (e) {
      // emit(AyatErrorState());

      // }
      // ;
    });
  }
}
