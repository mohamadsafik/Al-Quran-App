import '../model/detail_surah_model.dart';

abstract class AyatState {}

class AyatLoadingState extends AyatState {}

class AyatLoadedState extends AyatState {
  final DetailSurah detailSurah;


  AyatLoadedState({required this.detailSurah});
}

class AyatErrorState extends AyatState {}
