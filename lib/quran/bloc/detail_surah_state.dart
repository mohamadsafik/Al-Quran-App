import '../../model/detail_surah_model.dart';

abstract class DetailSurahState {}

class DetailSurahLoadingState extends DetailSurahState {}

class DetailSurahLoadedState extends DetailSurahState {
  final DetailSurah detailSurah;


  DetailSurahLoadedState({required this.detailSurah});
}

class DetailSurahErrorState extends DetailSurahState {}
