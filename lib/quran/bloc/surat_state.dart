import 'package:tests/quran/model/surat_quran_model.dart';

abstract class SuratState {}

class SuratLoadingState extends SuratState {}

class SuratLoadedState extends SuratState {
  final List<SuratQuranModel> suratQuran;

  SuratLoadedState({required this.suratQuran});
}

class SuratErrorState extends SuratState {
  final String error;

  SuratErrorState({required this.error});
}
