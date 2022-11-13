import 'package:bloc/bloc.dart';
import 'package:tests/quran/bloc/surat_event.dart';
import 'package:tests/quran/bloc/surat_state.dart';
import 'package:tests/quran/repository/al_quran.dart';

class SuratBloc extends Bloc<SuratEvent, SuratState> {
  final quranRepository = QuranRepository();

  SuratBloc() : super(SuratLoadingState()) {
    on<SuratEvent>((event, emit) async {
      if (event is SuratLoadedState) {
        emit(SuratLoadingState());
      }
      try {
        final surats = await quranRepository.getSurat();
        emit(SuratLoadedState(suratQuran: surats));
      } catch (e) {
        emit(SuratErrorState(error: e.toString()));
      }
    });
  }
}
