import '../model/detail_surah_model.dart';

abstract class AyatState {}

class AyatLoadingState extends AyatState {}

class AyatLoadedState extends AyatState {
  final DetailSurah detailSurah;
  final String urlId;

  AyatLoadedState({required this.detailSurah, required this.urlId});
}

class AyatErrorState extends AyatState {}
