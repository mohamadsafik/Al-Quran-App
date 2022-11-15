import '../../model/list_surah_model.dart';

abstract class ListSurahState {}

class ListSurahLoadingState extends ListSurahState {}

class ListSurahLoadedState extends ListSurahState {
  final List<ListSurahModel> listSurahQuran;

  ListSurahLoadedState({required this.listSurahQuran});
}

class ListSurahErrorState extends ListSurahState {
  final String error;

  ListSurahErrorState({required this.error});
}
